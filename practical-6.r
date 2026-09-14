library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)
titanic <- read.csv("titanic.csv")
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

model_binary <- glm(
  survived ~ pclass + sex + age + accompanied,
  data = titanic,
  family = binomial(link = "logit")
)

summary(model_binary)

ggplot(titanic, aes(x = survived)) +
  geom_bar() +
  facet_grid(pclass ~ sex)