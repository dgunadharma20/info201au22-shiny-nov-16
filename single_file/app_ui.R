library(shiny)

# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  # Application title
  titlePanel("CountLove Dataset"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      uiOutput("selectState")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("statePlot"),
      textOutput("sampleText")
    )
  )
))
