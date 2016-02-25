#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(magrittr)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(

   # Application title
   titlePanel("Lab 8 - Regressão Linear"),

   # Sidebar with a slider input for number of bins
   sidebarLayout(
      sidebarPanel(
          helpText("Selecione a variavel resposta e a covariavel para ajuste
                   do gráfico."),

          selectInput(inputId =  "a",
                      label = "Variavel Resposta",
                      choices = list(
                          "carat" = "carat",
                          "cut" = "cut",
                          "color" = "color",
                          "clarity" = "clarity",
                          "price" = "price"
                      ),
                      selected = "carat"
          ),
          selectInput(inputId =  "b",
                      label = "Covariavel",
                      choices = list(
                          "carat" = "carat",
                          "cut" = "cut",
                          "color" = "color",
                          "clarity" = "clarity",
                          "price" = "price"
                      ),
                      selected = "price"
          )
      ),

      # Show a plot of the generated distribution
      mainPanel(
          fluidRow({
              plotOutput("id_graf")
          })
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {

    output$id_graf <- renderPlot({
        y <- input$a
        x <- input$b

        lm(diamonds[[y]] ~ diamonds[[x]]) %>%
            coef() -> coeficiente

        ggplot(diamonds) +
            geom_point(aes_string(x,y),
                       color = "dark gray"
                       ) +
            geom_abline(intercept = coeficiente[1],
                        slope = coeficiente[2],
                        color = "red"
                        )
    })

})

# Run the application
shinyApp(ui = ui, server = server)

