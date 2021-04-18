
# Lesson 4. Display reactive output ---------------------------------------

library(shiny)

# Step1: Add an R object to the UI

# dataTableOutput 	  DataTable
# htmlOutput	        raw HTML
# imageOutput	        image
# plotOutput	        plot
# tableOutput	        table
# textOutput	        text
# uiOutput	          raw HTML
# verbatimTextOutput	text
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", 
                              "Percent Black",
                              "Percent Hispanic", 
                              "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(
      # *Output 형태의 함수는 입력값으로 문자를 받음
      textOutput("selected_var")
    )
  )
)

# Step 2: Provide R code to build the object
# ui에서 사용할 object를 정의 하고 나서, 해당 오브젝트는 server의 output에 담아준다
# renderDataTable	  DataTable
# renderImage	      images (saved as a link to a source file)
# renderPlot	      plots
# renderPrint	      any printed output
# renderTable	      data frame, matrix, other table like structures
# renderText	      character strings
# renderUI	        a Shiny tag object or HTML

server <- function(input, output) {
  
  # render*는 입력값으로 하나의 {}를 받음. 특정 코드 혹은 함수를 실행가능
  # render* 형태의 함수는 ui에 사용한 *Output과 형태를 맞춰 사용한다고 생각하면 됨.
  
  output$selected_var <- renderText({
    paste("You have selected ", input$var)
  })


  # 마지막에 return(output) 필요없음
}

shinyApp(ui = ui, server = server)
runApp('./Lesson/Lesson_04.R', display.mode = 'showcase')
