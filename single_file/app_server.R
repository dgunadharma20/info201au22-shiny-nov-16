library(shiny)
library(tidyverse)
library(ggplot2)

data <- read.csv("https://countlove.org/data/data.csv")

data <- data %>% 
  mutate(states = str_sub(Location, -2, -1)) %>% 
  head(500)

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
  output$selectState <- renderUI({
    selectInput("state", "Choose a state:", choices = unique(data$states))
  })
  
  scatterPlot <- reactive({
    plotData <- data %>% 
      filter(states %in% input$state)
    
    ggplot(plotData, aes(x = Date, y = Attendees)) +
      geom_point(aes(color = Location)) +
      labs(x = "date of protests",
           y = "number of attendees", 
           title = paste("date vs attendees in", input$state))
  })
  
  output$statePlot <- renderPlot({
    scatterPlot()
  })
  
  output$sampleText <- renderText({
    paste("Hello! Welcome to my sample Shiny web app. This visualization shows a scatter of the number of attendees, depending
            on the date of the protest and the state it happened in.")
  })
  
})