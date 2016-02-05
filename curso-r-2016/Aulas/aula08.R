# Shiny
library(shiny)

shiny::runGitHub('abjur/vistemplate',
                 subdir='exemplo_01_helloworld',
                 display.mode='showcase')


# reactive - run once
# isolate - let choose filter so it can run later