library(dplyr)
library(ggplot2)
titanic <- read_csv("titanic.csv")
titanic <- titanic |>
mutate(survived = as.logical(survived))

titanic <- titanic |>
  mutate(accompanied = (sibsp + parch) > 0)

ggplot(titanic, aes(x = survived, y = age)) +
  geom_boxplot() +
  labs(
    x = "Survived",
    y = "Age"
  )
