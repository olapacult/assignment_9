library(shiny)

fluidPage(
  titlePanel("The expression in TPMs of gene"),
  
  sidebarLayout(

    sidebarPanel(
      
      # Dropdown menu for selecting a gene
      selectInput(
        "Gene",
        "Choose gene: ",
        choices = NULL
      ), 
      
      # Radio buttons for choosing bar color
      radioButtons( 
        "col",
        "Bar color:",
        choices = c("pink" ="#F8C8DC", "blue" = "#A9D1F5", "purple" = "#D8B6E5", "green" = "#B7E6D5"),
        selected = "#D8B6E5"
      ),
      
      # Slider to adjust the font size on the plot
      sliderInput(
        "fontsize",
        "Font size:", 
        min = 8, 
        max = 24, 
        value = 12
      )
    ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)
