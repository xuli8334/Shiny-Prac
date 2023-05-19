library(shiny)
library(DT)  # For rendering the data table

# Load the helper functions from helper.R
source("helpers.R")

# Define the UI
ui <- fluidPage(
  titlePanel("Local Data Frame Example"),
  sidebarLayout(
    sidebarPanel(
      # No inputs in this example
    ),
    mainPanel(
      dataTableOutput("data_table"),
      textOutput("sum_output")
    )
  )
)

# Define the server
server <- function(input, output) {
  # Create a local data frame
  df = get(load("data.RData"))
  
  # Render the data table
  output$data_table <- renderDataTable(
    df,
    options = list(pageLength = 10)  # Set number of rows per page
  )
  
  # Use the helper function to calculate the sum of two numbers
  output$sum_output <- renderText({
    calculate_sum(5, 10)
  })
}

# Run the Shiny app
shinyApp(ui, server)
