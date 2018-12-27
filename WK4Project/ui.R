#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Diamond Price prediction"),
    sidebarPanel(
      #numericInput('carat1', 'Carat/grams', 0.12, min = 0.1, max = 0.35, step = 0.01 ),
     sliderInput('carat1', 'Carat/grams', 0.12, min = 0.1, max = 0.35, step = 0.01),
                   
      submitButton('Submit')
    ),
    mainPanel(
      
      h3("Histogram showing Diamonds in Carat"),
      plotOutput('Hist1'),
      
      h3("A plot of the Diamond Data"),
      plotOutput("Plot1"),
      
      h2('Results of prediction'),
      h3('You entered'),
      verbatimTextOutput("inputValue"),
      h3('Which resulted in a price of '),
      verbatimTextOutput("prediction"),
      h4("Note: Prices shown are not accurate and are approximations based on the diamond data")
      
    )
  )
)