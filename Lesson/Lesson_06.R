
# Lesson 6. Use reactive expresiions --------------------------------------
# shiny는 사용자가 빠르고 즉시적으로 반응하는 용도로 사용하는 것을 추구한다.
# 하지만 만약 app 실행에 시간이 오래걸리는 연산이 포함될 경우 성능이 저하될 것이다.
# 이번에는 불필요한 연산을 최소화 하여 앱이 느려지는 것을 방지하기 위한  Reactive expression을 알아 볼것이다.

# StockVis는 R의 quantmod 패키지를 실행하는 것으로 아래 패키지를 설치해야함
install.packages('quantmod')
runApp('Lesson/stockVis/')

# stockVis 사용법
# 1. stock 선택
# 2. 조회 날짜 범위 설정
# 3. log scale 변환여부 선택
# 4. 인플레이션 반영 여부 선택 <- 아직 작동하지 않음

# stockVis는 quantmo의 두가지 함수를 사용하여 구성되어있음
# 1. 'getSymbols'로 yahoo finance,  Federal Reserve Bank of St. Louis에서 데이터를 다운로드 받음
# yahoo finance : https://finance.yahoo.com/?guccounter=1&guce_referrer=aHR0cHM6Ly9zaGlueS5yc3R1ZGlvLmNvbS8&guce_referrer_sig=AQAAACSajTEQ3MbfQbeOzR3FryX5SFqTfe77u_Ahk-6u1EXrf6h7g6uGL2pPXL-gWFStNdAQTBkjDFrTQzO05JI8kZwXZRlgj10m00I1xf8N1vORNEOleTAOulifUnl1ekAJpEpNPqjgq-HQLfDE0nqCdcW38ARUcNf7MZn4Uqq0d1aG
# Federal Reserve Bank of St. Louis : https://fred.stlouisfed.org/
# `chartSeries`를 통해 주가차트 plotting



# 계산간소화하기 -----------------------------------------------------------------

# stockVis는 현재 코드 구성에 문제가 있음
# "Plot y axis on log scale"를 클릭하게되면, input$log 값이 변경되게 되고, 전체 renderPlot을 다시 실행하게 된다.
# 1. Yahho finance에서 symbol을 이용해 데이터를 가지고 옴
# 2. data를 이용해 그래프를 고쳐서 그림

output$plot <- renderPlot({
  data <- getSymbols(input$symb, src = "yahoo",
                     from = input$dates[1],
                     to = input$dates[2],
                     auto.assign = FALSE)
  
  chartSeries(data, theme = chartTheme("white"),
              type = "line", log.scale = input$log, TA = NULL)
})


# Reactive expressions ----------------------------------------------------

# reactive expressions을 사용해서 재실행 되는 코드를 제한할 수 있음
# reactive expression은 widget의 인풋을 받아 값을 반환하는 R expression 형태를 취하며, original widget 값이 변할 때 업데이트된다.
# 'reactive' 함수를 통해 생성할 수 있음
# getSymbols를 reactive를 사용하면 다음과 같이 나타남
dataInput <- reactive({
  getSymbols(input$symb, src = "yahoo",
             from = input$dates[1],
             to = input$dates[2],
             auto.assign = FALSE)
})

# 해당 expression을 실행하게되면, getSymbols를 실행한것과 동일한 결과를 반한홤.
# 해당 expression을 실행하여 데이터를 renderPlot에서 사용하기 위해서는 dataInput()을 사용함.
output$plot <- renderPlot({
  chartSeries(dataInput(), theme = chartTheme("white"),
              type = "line", log.scale = input$log, TA = NULL)
})

# reactive expression을 사용하면 현재 값이 오래된 데이터인지를 확인함.
# 처음에는 동일하게 expression을 실행하고 값을 저장해둠
# 다음번 실행 때 저장되어 있는 데이터를 불러와 사용하기에 속도적으로 빨라짐



# Adjust prices for inflation fix -----------------------------------------
# 소비물가지수를 이용해 주가를 현재수준에 맞추어 수정할 수 있도록 기능을 추가
# 아래를 통해 해당 기능을 수정할 수 있지만 이는 바람직 하지 못함

server <- function(input, output) {
  
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo",
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  output$plot <- renderPlot({   
    data <- dataInput()
    if (input$adjust) data <- adjust(dataInput())
    
    chartSeries(data, theme = chartTheme("white"),
                type = "line", log.scale = input$log, TA = NULL)
  })
}


# 해당문제를 해결해 보시오 !