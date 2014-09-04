## Shiny App UI for Coursera Course Project - Developing Data Products

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Coursera Course Project - Developing Data Products"),
  
 
    mainPanel(
      plotOutput("distPlot")
    )
  )
)