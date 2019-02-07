#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Predict Diamond Prices Based on Number of Inputs"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderNoOfData", "What is the number of random data you want to select from \"Diamond\" Dataset?", 100, 500, value = 15),
            textInput("seed1", "Enter the Seed to be used for random selection:(Maximum - 1999999999)", value = "13019"),
            hr(),
            h4("Linear Model's Parameters"),
            textOutput("slopeOut"),
            textOutput("intOut"),
            hr(),
            h4("Prices of Diamond ($)"),
            textOutput("c1Out"),
            textOutput("c2Out"),
            textOutput("c3Out"),
            textOutput("c4Out"),
            textOutput("c45Out"),
            textOutput("c5Out"),
            hr()
        ),
        mainPanel(
            plotOutput("plot1", brush = brushOpts(
                id = "brush1"
            ))
        )
    )
))