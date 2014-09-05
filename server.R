## Shiny App Server for Coursera Course Project - Developing Data Products
library(shiny)
library(class)
library(e1071) 
classifier <- naiveBayes(Survived ~ .,data=Titanic)

shinyServer(function(input, output) {
  
  output$text <- renderText({
    ip <- data.frame(Titanic)[NULL,1:3]
   ip[1,] <- rbind(c(input$class,input$sex,input$age))
    rs <- as.character(predict(classifier,ip[,]))
    if (rs == "Yes") {op <-"Looks good, you would have made it!"}
    if (rs == "No") {op <- "Sorry, but you would have been feeding the dwellers of the sea"}
  op
  })
  output$image <- renderImage({
    ip <- data.frame(Titanic)[NULL,1:3]
    ip[1,] <- rbind(c(input$class,input$sex,input$age))
    rs <- as.character(predict(classifier,ip[,]))
    if (rs == "No") {filename <- normalizePath(file.path('./images',
                                        'shark.jpeg')) }
    else {filename <- normalizePath(file.path('./images',
                                              'boat.gif'))}
    # Return a list containing the filename and alt text
    list(src = filename,
         alt = paste("Image number", input$n))
    
  }, deleteFile = FALSE)
})