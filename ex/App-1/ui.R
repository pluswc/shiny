## ui.R ##
library(shinydashboard)

ui <- dashboardPage(
  # dashboardHeader ----
  
  dashboardHeader(title = 'Basic dashboard'),
  
  # dashboardSlidebar ----
  
  dashboardSidebar(),
  # dashboardbody ----
  
  dashboardBody(
    # Boxes need to be put in a row (ro column)
    fluidRow(
      box(
        plotOutput('plot1', height =  250)
        ),
      
      box(
        title = 'Controls',
        sliderInput(
          inputId = 'slider',
          label = 'Number of observations:',
          min = 1,
          max = 100,
          value = 50
        )  
      )
    )
  )
)
