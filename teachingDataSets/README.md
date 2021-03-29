# Some Teaching Data Sets and Their Uses

## Repositories

### Princeton

https://data.princeton.edu/wws509/datasets

## csv files

### Birthweight_reduced_R.csv

Small, simple data set.

- Response: Birthweight (continuous) or LowBirthWeight (binary)
- Predictors: Mixed types

Attribution: https://www.sheffield.ac.uk/mash/statistics/datasets


### BL-Flickr-Images-Book.csv

Messy data, good for teaching cleaning

- Reponse: NA
- Predictors: NA


### diabetes.csv

Diabetes outcomes.

- Reponse: Binary indicator for diabetes status (1 = has diabetes)
- Predictors: All continuous

Dictionary

| Name | Type | Description |
| --- | --- | --- |
| Pregnancies | Count | Number of times pregnant |
| Glucose | Cont. | Plasma glucose concentration a 2 hours in an oral glucose tolerance test |
| BloodPressure | Cont. | Diastolic blood pressure (mm Hg) |
| SkinThickness  | Cont. | Triceps skin fold thickness (mm) |
| Insulin | Cont. | 2-Hour serum insulin (mu U/ml) |
| BMI | Cont. | Body mass index (weight in kg/(height in m)^2) |
| DiabetesPedigree | Cont. | Diabetes pedigree function |
| Age | Cont. | Age (years) |
| Outcome | Binary | Class variable (0 or 1) 268 of 768 are 1, the others are 0 |

Attribution: https://www.kaggle.com/uciml/pima-indians-diabetes-database

### Misspell.csv

Misspellings of my name (Devan) on midterm and final exams. Good for data cleaning, simple visualizations.

- Reponse: Spelling of my first name
- Predictors: NA



### stackOverflowSurveyResults.csv

Small version of the full Stackoverflow survey in 2019. Modified to only include jobs with "Data" or "Academic" in the name, which makes it more relevant to academic audiences. Reduced number columns to be more manageable.

- Reponse: ConvertedComp (Continuous); JobSat (Ordinal)
- Predictors: Numerous, mixed types
