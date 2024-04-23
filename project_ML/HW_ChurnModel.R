library(tidyverse)
library(caret)

df <- read_csv("churn.csv")
df_starter <- df
glimpse(df)
glimpse(df_starter)

## 1. split data
train_test_split <- function(data, size=0.8) {
  set.seed(42)
  n <- nrow(data)
  train_id <- sample(1:n,size*n)
  train_df <- data[train_id, ]
  test_df <- data[-train_id, ]
  return( list(train_df, test_df))
}
prep_df <- train_test_split(df_starter, size=0.8)

## 2. train model
set.seed(42)
ctrl <- trainControl(method="cv",
                     number=25,
                     summaryFunction = prSummary,
                     classProbs = TRUE)
churn_model <- train(churn ~ .,
               data = prep_df[[1]],
               method = "rpart",
               metric = "Precision",
               trControl = ctrl)

## 3. score
p <- predict(churn_model, newdata = prep_df[[2]])

## 4. evaluate
confusionMatrix(p,  as.factor(prep_df[[2]]$churn),
                positive="Yes",
                mode="prec_recall")

## Summary 
## Get Precision = 0.8356%
