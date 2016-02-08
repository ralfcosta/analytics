# Shiny
library(shiny)
library(magrittr)

shiny::runGitHub('abjur/vistemplate',
                 subdir='exemplo_01_helloworld',
                 display.mode='showcase')


# reactive - run once
# isolate - let choose filter so it can run later


diamonds %>%
    lm(carat ~ price, data = .) %>%
    coef() -> coef_lm

ggplot(diamonds) +
    geom_point(aes(x = carat, y = price)) +
    geom_abline(intercept = coef_lm[1], slope = coef_lm[2])
