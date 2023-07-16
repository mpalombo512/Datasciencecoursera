install.packages("shiny")
library(shiny)
library(datasets)

AirData <- airquality

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("Ozone ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("Ozone ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=AirData)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$AirQualityBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = AirData,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$AirQualityPlot <- renderPlot({
    with(AirData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})
