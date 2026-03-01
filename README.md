# Analyzing-Track-Popularity-Using-Spotify-Dataset
🎧 Spotify Track Popularity Prediction

Data Analytics & Machine Learning Project in R

📌 Executive Summary

This project analyzes a real-world Spotify dataset to identify the key factors that drive track popularity and builds a predictive model using Linear Regression.

Using statistical testing and machine learning, the project uncovers how artist influence, release timing, and content characteristics affect streaming success.

🎯 Business Problem

Streaming platforms rely heavily on analytics to:

Recommend songs

Promote artists

Maximize listener engagement

This project answers:

What factors significantly impact track popularity?

🔍 Analytical Approach

The project follows the Big Data Analytics Lifecycle:

Data Cleaning & Preprocessing

Exploratory Data Analysis (EDA)

Hypothesis Testing

Correlation Analysis

Predictive Modeling

Model Evaluation

📊 Key Insights

📈 Artist popularity and follower count are the strongest predictors

🆕 Newer tracks significantly outperform older tracks

🔞 Explicit content has a statistically significant impact

⏱️ Track duration moderately influences popularity

📉 Popularity distribution is concentrated in mid–high range (40–80)

🧪 Statistical Testing

Two Independent T-Tests were conducted:

Explicit vs Non-Explicit Tracks → Significant difference

Older vs Newer Tracks → Newer tracks significantly more popular

🤖 Machine Learning Model

Model: Linear Regression

Features Used:

Artist popularity

Artist followers

Album total tracks

Track duration

Explicit content

Release year

📊 Evaluation Metrics

RMSE

MAE

R²

The model demonstrates strong explanatory power and reasonable prediction error, confirming the importance of artist-related variables.

🛠️ Technologies

R

tidyverse

caret

Statistical Modeling

Data Visualization
