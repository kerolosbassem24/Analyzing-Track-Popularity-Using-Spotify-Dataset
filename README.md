# Analyzing-Track-Popularity-Using-Spotify-Dataset
🎧 Spotify Track Popularity Analysis

Big Data Analytics Project using R

📌 Project Overview

This project applies the Big Data Analytics Lifecycle to a real-world Spotify dataset to analyze and predict track popularity.

The goal is to understand what factors influence a song’s popularity using:

Exploratory Data Analysis (EDA)

Hypothesis Testing

Correlation Analysis

Linear Regression Modeling

Model Evaluation Metrics

📂 Dataset Description

The dataset contains Spotify track, artist, and album information including:

track_popularity (0–100)

artist_popularity

artist_followers

explicit (TRUE/FALSE)

album_total_tracks

track_duration_min

album_release_date

release_year (extracted)

After cleaning:

Duplicates removed

Missing values handled

Variables converted to correct data types

🔎 Exploratory Data Analysis

Key findings:

Most tracks have moderate popularity (40–80 range)

Artist popularity strongly correlates with track popularity

Artists with 1M+ followers produce more popular tracks

Newer tracks tend to have higher popularity

Explicit content has a statistically significant effect

Visualizations included:

Histogram

Boxplots

Scatter plots with regression line

Density plot

🧪 Hypothesis Testing
Test 1: Explicit vs Non-Explicit Tracks

Independent T-Test

Result: Statistically significant difference

Test 2: Older vs Newer Tracks

Independent T-Test

Result: Newer tracks significantly more popular

🤖 Machine Learning Model
Technique Used

Linear Regression

Model Features

Artist popularity

Artist followers

Album total tracks

Track duration

Explicit content

Release year

Data Split

70% Training

30% Testing

Stratified sampling using caret

📊 Model Evaluation Metrics

RMSE (Root Mean Squared Error)

MAE (Mean Absolute Error)

R² (Coefficient of Determination)

The model demonstrates good explanatory power and reasonable prediction error.

🛠️ Technologies Used

R

tidyverse

caret

base R visualization

🚀 How to Run the Project

Install required packages:

install.packages(c("tidyverse", "caret"))

Place the dataset in your working directory.

Run the R script.

📌 Key Insights

Artist popularity and followers are the strongest predictors.

Recency significantly impacts popularity.

Explicit content influences track performance.

Linear regression provides interpretability with solid performance.
