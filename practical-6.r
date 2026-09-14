library(dplyr)
titanic <- read_csv("titanic.csv")
titanic <- titanic |>
mutate(survived = as.logical(survived))