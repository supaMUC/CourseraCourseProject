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
                          ,h4("How to use this app")
                          ,p("From the sidebar on the left you can choose the various input parameters.")
                          ,p("The class represents whether the passenger was hosted in 1st, 2nd or 3rd class or 
                             whether he was part of the crew.")
                          ,p("Whenever you change one of the values, a new prediction will be made by the classifier
                             built during the start-up of the application and the respective text and image corresponding
                             to the prediction will be shown.")
                          ,h3("Prediction:")
                          ,h4(tableOutput("text"))
                          ,imageOutput("image"), align = "center")
                         
  )
))
