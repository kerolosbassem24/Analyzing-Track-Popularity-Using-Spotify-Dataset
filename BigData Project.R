# Big Data Analytics Project - Spotify Dataset

# 1. Load Required Libraries

library(tidyverse)
library(caret)


# 2. Load Dataset

spotify <- read.csv("C:/Users/NEW LAP/Downloads/spotify_data clean (1).csv")

# Understand the data
str(spotify)
summary(spotify)

# 3. Data Cleaning

# Remove duplicates
spotify <- distinct(spotify)

# Remove missing values
spotify <- na.omit(spotify)

# Convert explicit to factor
spotify$explicit <- as.factor(spotify$explicit)

# Extract release year 
spotify$release_year <- as.numeric(
  stringr::str_extract(spotify$album_release_date, "\\d{4}")
)

spotify <- spotify[!is.na(spotify$release_year), ]

# Convert numeric attributes
spotify$track_popularity   <- as.numeric(spotify$track_popularity)
spotify$artist_popularity  <- as.numeric(spotify$artist_popularity)
spotify$artist_followers   <- as.numeric(spotify$artist_followers)
spotify$album_total_tracks <- as.numeric(spotify$album_total_tracks)
spotify$track_duration_min <- as.numeric(spotify$track_duration_min)

spotify <- na.omit(spotify)


# 4. Exploratory Data Analysis 


# Histogram
hist(
  spotify$track_popularity,
  col = "lightblue",
  main = "Histogram of Track Popularity",
  xlab = "Track Popularity"
)

# Boxplot
boxplot(
  spotify$track_popularity,
  main = "Boxplot of Track Popularity",
  ylab = "Track Popularity",
  col = "orange"
)

# Follower groups
spotify$follower_group <- cut(
  spotify$artist_followers,
  breaks = c(0, 1e5, 1e6, 1e7, 1e8, Inf),
  labels = c("<100k", "100k–1M", "1M–10M", "10M–100M", "100M+")
)

boxplot(
  track_popularity ~ follower_group,
  data = spotify,
  col = "lightblue",
  main = "Track Popularity by Artist Follower Groups",
  xlab = "Artist Followers",
  ylab = "Track Popularity"
)

# Artist popularity vs track popularity
plot(
  spotify$artist_popularity,
  spotify$track_popularity,
  pch = 16,
  col = rgb(0, 0, 1, 0.3),
  main = "Artist Popularity vs Track Popularity",
  xlab = "Artist Popularity",
  ylab = "Track Popularity"
)

abline(
  lm(track_popularity ~ artist_popularity, data = spotify),
  col = "red",
  lwd = 2
)

# Density plot
plot(
  density(spotify$track_popularity),
  main = "Density Plot of Track Popularity"
)

# Duration groups
spotify$duration_group <- ifelse(
  spotify$track_duration_min < median(spotify$track_duration_min),
  "Short Tracks",
  "Long Tracks"
)

boxplot(
  track_popularity ~ duration_group,
  data = spotify,
  col = c("lightgreen", "lightpink"),
  main = "Track Popularity by Duration Group",
  xlab = "Track Duration",
  ylab = "Track Popularity"
)

# Popularity vs release year
plot(
  spotify$release_year,
  spotify$track_popularity,
  pch = 16,
  col = rgb(0, 0, 0, 0.3),
  main = "Track Popularity vs Release Year",
  xlab = "Release Year",
  ylab = "Track Popularity"
)


# 5. Hypothesis Testing 

# Test 1: Explicit vs Non-explicit
explicit_yes <- spotify$track_popularity[spotify$explicit == "TRUE"]
explicit_no  <- spotify$track_popularity[spotify$explicit == "FALSE"]
t.test(explicit_yes, explicit_no)


# Test 2: Older vs Newer Tracks
spotify$release_period <- ifelse(
  spotify$release_year < median(spotify$release_year),
  "Older Tracks",
  "Newer Tracks"
)

older_tracks <- spotify$track_popularity[spotify$release_period == "Older Tracks"]
newer_tracks <- spotify$track_popularity[spotify$release_period == "Newer Tracks"]
t.test(older_tracks, newer_tracks)


# 6. Correlation Analysis 

numeric_data <- spotify[, c(
  "track_popularity",
  "artist_popularity",
  "artist_followers",
  "album_total_tracks",
  "track_duration_min",
  "release_year"
)]

cor(numeric_data)


cor(spotify$track_popularity, spotify$release_year)
cor(spotify$track_popularity, spotify$track_duration_min)


# 7. Dataset Preparation 
set.seed(123)

index <- createDataPartition(
  spotify$track_popularity,
  p = 0.7,
  list = FALSE
)

train_data <- spotify[index, ]
test_data  <- spotify[-index, ]


summary(train_data$track_popularity)
summary(test_data$track_popularity)


# 8. Linear Regression Model


model <- lm(
  track_popularity ~ artist_popularity +
    artist_followers +
    album_total_tracks +
    track_duration_min +
    explicit +
    release_year,
  data = train_data
)

summary(model)


# Compare R-squared
summary(model)$r.squared

# 9. Prediction & Evaluation


pred <- predict(model, test_data)

# Evaluation metrics
RMSE(pred, test_data$track_popularity)
R2(pred, test_data$track_popularity)
MAE(pred, test_data$track_popularity)


