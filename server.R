library(shiny)

calBMI <- function(system, height, weight) {
  BMI <- 0
  if (system == 1) {
    BMI <- weight/(height/100)^2
  } else {
    BMI <- (weight*703)/(height)^2
  }
  round(BMI,2)
}

shinyServer(
  function(input, output) {
    output$height <- renderPrint({input$height})
    output$weight <- renderPrint({input$weight})
    output$BMI <- renderPrint({calBMI(input$system, input$height, input$weight)})
  }
)