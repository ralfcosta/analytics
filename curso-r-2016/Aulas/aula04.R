# ggplot2

install.packages("ggplot2")
library(ggplot2)

# boxplot
ggplot(data = mtcars) +
    geom_boxplot(aes(x = as.character(gear), y = mpg, fill = as.character(gear))) +
    xlab("") +
    ylab("Milhas por Galão") +
    labs(fill = "Número de Marchas")

# line
ggplot(economics, aes(date,unemploy)) + geom_line()


# histogram
head(diamonds)

ggplot(diamonds, aes(price)) + geom_histogram(colour = "white", fill = "blue")


# correlation
cor(diamonds$price, diamonds$carat)

# alpha defines the thickness of the point (like transparency)
ggplot(diamonds, aes(carat, price)) + geom_point(alpha = 0.1)

ggplot(diamonds, aes(carat, price)) +
    geom_point(alpha = 0.1, aes(colour = cut)) +
    facet_wrap(~cut)

ggplot(diamonds, aes(carat, price)) +
    geom_point(aes(colour = cut)) +
    geom_point(size = 2, alpha = 0.1) +
    facet_wrap(~cut)

library(dplyr)
library(tidyr)
ggplot(diamonds %>% sample_n(1000), aes(carat, price)) +
    geom_point(aes(colour = cut)) +
    geom_point(size = 2, alpha = 0.1) +
    facet_wrap(~cut) +
    labs(x = "Peso (Quilates)", y = "Preço (US$)", colour = "Corte")


# two lines
View(economics)

ggplot(economics, aes(date, unemploy)) +
    geom_line()

ggplot(economics, aes(date, uempmed)) +
    geom_line()


economics %>%
    mutate(unemploy = (unemploy - min(unemploy))/(max(unemploy) - min(unemploy)),
           uempmed = (uempmed - min(uempmed))/(max(uempmed) - min(uempmed))) %>%
    ggplot(aes(date,unemploy)) +
    geom_line(colour = "red") +
    geom_line(aes(y = uempmed), colour = "blue")


economics %>%
    select(date, unemploy, uempmed) %>%
    gather(indice, valor, -date) %>%
    group_by(indice) %>%
    mutate(valor_pad = (valor - min(valor))/(max(valor) - min(valor))) %>%
    ggplot(aes(x = date, y = valor_pad , colour = indice)) +
    geom_line() +
    scale_color_manual("Índice", values = c("red","blue"),
                       labels = c("Desemprego","Tempo Desemprego (Meses)")) +
    labs(x = "Data", y="Valor")

# put line in scatterplot

coef(lm(price ~ carat, data = diamonds %>% sample_n(1000)))

ggplot(diamonds %>% sample_n(1000), aes(carat, price)) +
    geom_point() +
    geom_abline(intercept = -2258.311, slope = 7647.504, colour = "blue", linetype = "dashed", size = 1)

ggplot(diamonds %>% sample_n(1000), aes(carat, price)) +
    geom_point() +
    geom_smooth(method = lm)

ggplot(diamonds %>% sample_n(1000), aes(x = carat, y = price, colour = cut)) +
    geom_point() +
    geom_smooth(method = lm)


# bar plot

table(diamonds$cut)
diamonds %>%
    group_by(cut) %>%
    summarise(n = n()) %>%
    mutate(perc = n/sum(n)) %>%
    ggplot(aes(x = 1, y = perc, fill = cut)) +
    geom_bar(stat = "identity") +
    coord_polar(theta = "y")

ggplot(diamonds, aes(cut)) + geom_bar()

# map
install.packages("maps")
library(maps)
mapa <- map_data("world")
head(mapa)


library(dplyr)
diamonds %>%
    sample_n(10000) %>%
    group_by(cut) %>%
    mutate(correlacao = cor(carat, price)) %>%
    ungroup() %>%
    mutate(cut = paste(cut, "cor =", round(correlacao,2))) %>%
    ggplot(aes(x = carat, y = price)) +
    geom_point(aes(colour = cut)) +
    geom_text(aes(x = 3, y = 2500, label = paste("r² = ", round(correlacao,2)))) +
    facet_wrap(~cut) +
    labs(x = "Peso (Quilates)", y = "Preço (US$)") +
    guides(colour = F)






