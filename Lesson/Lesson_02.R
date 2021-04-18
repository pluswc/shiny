
# Lesson 2. Build a user interface ----------------------------------------

library(shiny)

# Define UI ----

# # 1. Layout
# 
# ui <- fluidPage(
# 
#   titlePanel('Title Pannel'),
# 
#   # position = 'right'
#   sidebarLayout(
#     sidebarPanel('Sidebar Panel'),
#     mainPanel('Main Panel')
#   )
# 
#   # 'fluidRow', 'column'을 통해 layout customize도 가능하며, 다양한 페이지를 가진 화면 구성도 가능
# 
# )


# # 2. HTML Content
# # *Pannel 형태의 함수는 내부 문자열들을 html tag를 이용해 꾸며줄 수 있음
# 
# h1("My title")
# 
# ui <- fluidPage(
# 
#   titlePanel("My Shiny App"),
#   sidebarLayout(
# 
#     sidebarPanel(),
# 
#     mainPanel(
#       h1("First level title"),
#       h2("Second level title"),
#       h3("Third level title"),
#       h4("Fourth level title"),
#       h5("Fifth level title"),
#       h6("Sixth level title")
#     )
#   )
# )

## tag list
# names(tags)

# # Formatted Text
# ui <- fluidPage(
#   
#   titlePanel("My Shiny App"),
#   
#   sidebarLayout(
#     sidebarPanel(),
#     mainPanel(
#       p("p creates a paragraph of text."),
#       p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
#       strong("strong() makes bold text."),
#       br(),
#       em("em() creates italicized (i.e, emphasized) text."),
#       br(),
#       code("code displays your text similar to computer code"),
#       div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
#       br(),
#       p("span does the same thing as div, but it works with",
#         span("groups of words", style = "color:blue"),
#         "that appear inside a paragraph.")
#     )
#   )
# )

# # Images
# ui <- fluidPage(
#   titlePanel("My Shiny App"),
#   sidebarLayout(
#     sidebarPanel(),
#     mainPanel(
#       img(src = "rstudio.png", height = 140, width = 400)
#     )
#   )
# )


# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)

