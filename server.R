#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    model <- reactive({
        set.seed(input$seed1)
        #set.seed(input$seed1)
        diamonds <- diamonds[sample(nrow(diamonds), 500), ]
        brushed_data <- diamonds[sample(nrow(diamonds), input$sliderNoOfData), ]
        if(nrow(brushed_data) < 2){
            return(NULL)
        }
        lm(price ~ carat, data = brushed_data)
    })
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Slope: ",round(model()[[1]][2]),2)
        }
    })
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Intercept: ",round(model()[[1]][1]),2)
        }
    })
    
    output$c1Out <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Carat 1: ",round(model()[[1]][1] + model()[[1]][2]*1,2))
        }
    })
    output$c2Out <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Carat 2: ",round(model()[[1]][1] + model()[[1]][2]*2,2))
        }
    })
    
    output$c3Out <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Carat 3: ",round(model()[[1]][1] + model()[[1]][2]*3,2))
        }
    })
    
    output$c4Out <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Carat 4: ",round(model()[[1]][1] + model()[[1]][2]*4,2))
        }
    })
    
    output$c45Out <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Carat 4.5: ",round(model()[[1]][1] + model()[[1]][2]*4.5,2))
        }
    })
    
    output$c5Out <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            paste("Carat 5: ",round(model()[[1]][1] + model()[[1]][2]*5,2))
        }
    })
    
    output$plot1 <- renderPlot({
        set.seed(input$seed1)
        diamonds <- diamonds[sample(nrow(diamonds), 500), ]
        plot(diamonds$carat, diamonds$price, xlab = "Carat",
             ylab = "Price", main = "Price Vs Carat",
             cex = 1.5, pch = 19, bty = "n")
        brushed_data <- diamonds[sample(nrow(diamonds), input$sliderNoOfData), ]
        points.default(brushed_data$carat, y=brushed_data$price, type="p", pch=4, col="red",cex=4)
        if(!is.null(model())){
            abline(model(), col = "blue", lwd = 2)
        }
    })
})