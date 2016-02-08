# Modeling

library(magrittr)
library(dplyr)
library(ggplot2)
library(tree)

# https://www.linkedin.com/pulse/why-i-left-my-masters-program-charles-pensig-1

?mtcars

ajuste_lm <- lm(mpg ~ wt, data = mtcars)

coeficientes <- coef(ajuste_lm)

coeficientes

summary(ajuste_lm)

cor(mtcars$mpg, mtcars$wt)
cor(mtcars$mpg, mtcars$wt)^2

ajuste_lm2 <- lm(mpg ~ wt + cyl, data = mtcars)

anova(ajuste_lm2)


res <- residuals(ajuste_lm)

mtcars %>%
    add_rownames %>%
    filter(res %>% abs > 6)


library(tree)
ajuste_tree <- tree(factor(am) ~ wt, data = mtcars)
summary(ajuste_tree)

plot(ajuste_tree)
text(ajuste_tree, pretty = 0)

melhor_tree <- prune.tree(ajuste_tree, best = 2)
plot(melhor_tree)
text(melhor_tree, pretty = 0)

cv_tree <- cv.tree(ajuste_tree)

# return programmaticaly tree size
cv_tree$size[which.min(cv_tree$dev)]

