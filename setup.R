# Remove matching packages from writable R libraries.
# Keep this watchlist reviewed and specific to your exam policy.

watchlist <- paste(
  c("openai", "anthropic", "ellmer", "chattr", "gpt",
    "gemini", "claude", "ollama", "langchain", "llm"),
  collapse = "|"
)

libs <- .libPaths()
ip <- installed.packages()

for (lib in libs) {
  if (!dir.exists(lib) || file.access(lib, 2) != 0) next

  installed_here <- ip[ip[, "LibPath"] == lib, "Package"]
  matches <- installed_here[
    grepl(watchlist, installed_here, ignore.case = TRUE)
  ]

  if (length(matches)) {
    cat("\nRemoving from:", lib, "\n")
    print(matches)
    tryCatch(
      remove.packages(matches, lib = lib),
      error = function(e) cat("Removal failed:", conditionMessage(e), "\n")
    )
  }
}

# Recheck the active libraries and report any remaining matches.
ip_after <- installed.packages()
remaining <- ip_after[
  grepl(watchlist, ip_after[, "Package"], ignore.case = TRUE),
  c("Package", "LibPath"),
  drop = FALSE
]

if (nrow(remaining)) {
  cat("\nWARNING: Matching packages remain; these may be in a non-writable library:\n")
  print(remaining, row.names = FALSE)
} else {
  cat("\nNo watchlist packages remain in the active R libraries.\n")
}

cat("Checking for LLM providers\n")
config_file <- path.expand("~/.posit/ai/providers.json")

if (file.exists(config_file)) {
  if (requireNamespace("jsonlite", quietly = TRUE)) {
    config <- tryCatch(
      jsonlite::fromJSON(config_file, simplifyVector = FALSE),
      error = function(e) NULL
    )
    providers <- if (!is.null(config) && is.list(config$providers)) {
      names(config$providers)
    } else {
      character()
    }
    if (length(providers)) {
      cat("Provider entries found:", paste(providers, collapse = ", "), "\n")
    }
  }

  deleted <- unlink(config_file) == 0L

  if (deleted && !file.exists(config_file)) {
    cat("Deleted the provider settings file.\n")
  } else {
    cat("Could not delete the provider settings file; ask a proctor to check permissions.\n")
  }
} else {
  cat("No provider settings file found at the checked path.\n")
}
