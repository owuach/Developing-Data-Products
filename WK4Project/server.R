#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
data("diamond")

caratPrice <- function(carat) carat*1940


shinyServer(function(input, output) {
  
  attach(diamond)
  fit1 <- lm(price ~ carat, data = diamond)
  pred <- predict(fit1)
  
  output$Hist1 <- renderPlot({
    hist(carat, xlab='Carat in grams', col='lightblue',main='Histogram of Diamond')
    carat1 <- input$carat1
    lines(c(carat1, carat1), c(0, 100),col="red",lwd=5)
    mse <- mean((carat - carat1)^2)
    text(0.13, 20, paste("carat1 = ", carat1))
    text(0.13, 18, paste("MSE = ", round(mse, 10)))
  })
  
  output$Plot1 <- renderPlot({
    plot(diamond, xlab='Carat in grams', ylab="Price", col='blue',main='Plot of Diamond')
    carat1 <- input$carat1
    lines(c(carat1, carat1), c(0.13, 1000), col="red",lwd=5)
    mse <- mean((carat - carat1)^2)
    text(0.13, 900, paste("carat1 = ", carat1))
    text(0.13, 800, paste("MSE = ", round(mse, 10)))
    abline(fit1, col="red", lwd=5)
  })
  
  output$inputValue <- renderPrint({input$carat1})
  output$prediction <- renderPrint({caratPrice(input$carat1)})

}
  
 
)

