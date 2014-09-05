## Shiny App UI for Coursera Course Project - Developing Data Products

library(shiny)
dfTitanic <- data.frame(Titanic)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Coursera Course Project - Developing Data Products"),
  
  sidebarLayout(position = "left",
                sidebarPanel( selectInput("class","Class:",unique(dfTitanic$Class)),
                              radioButtons("sex","Sex:",unique(dfTitanic$Sex)),
                              radioButtons("age","Age:",unique(dfTitanic$Age))),
                mainPanel(h3("Would you have survived the sinking of the Titanic?")
                          ,"This little shiny app is making predictions on whether one would have survived 
                          the sinking of the Titanic or not. The predictor used is Naive Bayes and the basis 
                          for the analysis is the R example data set 'Titanic'."
                          ,"From the sidebar on the left you can choose the various input parameters."
                          ,h4(tableOutput("text"))
                          ,imageOutput("image"), align = "center")
  )
))
