
# Lesson 3. Add control widgets -------------------------------------------

library(shiny)

# actionButton	      Action Button
# checkboxGroupInput	A group of check boxes
# checkboxInput	      A single check box
# dateInput	          A calendar to aid date selection
# dateRangeInput	    A pair of calendars for selecting a date range
# fileInput	          A file upload control wizard
# helpText	          Help text that can be added to an input form
# numericInput	      A field to enter numbers
# radioButtons	      A set of radio buttons
# selectInput	        A box with choices to select from
# sliderInput	        A slider bar
# submitButton	      A submit button
# textInput	          A field to enter text


# Define UI ----
ui <- fluidPage(
  titlePanel("Basic widgets"),
  
  fluidRow(
    
    # actionButton
    # submitButton
    column(
      width = 3,
      h3('Buttons'),
      actionButton(
        inputId = 'action', 
        label = 'Action'
      ),
      br(),
      br(),
      submitButton(
        text = 'Submit'
      )
    ),
    
    # checkboxImput
    column(
      width = 3,
      h3('Single checkbox'),
      checkboxInput(
        inputId = 'checkbox',
        label = 'Choice A',
        value = TRUE
      )
    ),
    
    # checkboxGroupInput
    column(
      width = 3,
      checkboxGroupInput(
        inputId = 'checkGroup',
        label = h3('Checkbox group'),
        choices = list('Choice 1' = 1,
                       'Choice 2' = 2,
                       'Choice 3' = 3),
        selected = 1
      )
    ),
    
    # dateInput
    column(
      width = 3,
      dateInput(
        inputId = "date",
        label = h3("Date input"),
        value = "2014-01-01"
      )
    )
  ),
  
  fluidRow(
    
    # dateRangeInput
    column(
      width = 3,
      dateRangeInput(
        inputId = "dates",
        label = h3("Date range")
      )
    ),
    
    # fileInput
    column(
      width = 3,
      fileInput(
        inputId = 'file',
        label = h3('File input')
      )
    ),
    
    # helpText
    column(
      width = 3,
      h3('Help text'),
      helpText("Note: help text isn't a true widget,",
               'but it provides an easy way to add text to",
               "accompany other widgets.'
      )
    ),
    
    # numericInput
    column(
      width = 3,
      numericInput(
        inputId = 'num',
        label = h3('Numeric input'),
        value = 1
      )
    )
  ),
  
  fluidRow(
    
    # radioButtons 
    column(
      width = 3,
      radioButtons(
        inputId = 'radios',
        label = h3('Radio buttons'),
        choices = 
          list(
            'Choice 1' = 1,
            'Choice 2' = 2,
            'Choice 3' = 3
          ),
        selected = 1
      )
    ),
    
    # selectInput
    column(
      width = 3,
      selectInput(
        inputId = 'select',
        label = h3('Select box'),
        choices = 
          list(
            'Choice 1' = 1,
            'Choice 2' = 2,
            'Choice 3' = 3
          ),
        selected = 1
      )
    ),
    
    # slider Input
    column(3,
           sliderInput(
             inputId = 'slider1',
             label = h3('Sliders'),
             min = 0,
             max = 100,
             value = c(50)
           ),
           sliderInput(
             inputId = 'slider12',
             label = "",
             min = 0,
             max = 100,
             value = c(25, 75)
           )
    ),
    
    # textInput
    column(width = 3,
           textInput(
             inputId = 'text',
             label = h3('Text input'),
             value = 'Enter text...'
           )
    )
  )
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)


