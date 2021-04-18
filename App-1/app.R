## app.R ##
library(shiny)
library(shinydashboard)

source('./week_06/App-1/ui.R')
source('./week_06/App-1/server.R')
shinyApp(ui, server)
