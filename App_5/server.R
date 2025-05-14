library(shiny)
library(ggplot2)
library(tidyr)

TPM_data <- read.csv("TPMs_table_100genes.csv")

function(input, output, session) {
  

  observe({
    updateSelectInput(session, "Gene", choices = unique(TPM_data$GeneID))
  })
  # Reactive expression to filter the dataset for the selected gene
  data_sel <- reactive({
    subset(TPM_data, GeneID == input$Gene)
  })
  
  output$plot <- renderPlot({
    # I reshaped the data from wide to long format for plotting
    df2 <- pivot_longer(data_sel(), cols = -GeneID, names_to = "Sample", values_to = "TPM")
    # Then I created a bar plot using ggplot2
    ggplot(df2, aes(x = Sample, y = TPM)) +
      geom_bar(stat = "identity", fill = input$col, color = "black") +
      ggtitle(paste("TPM expression for", input$Gene)) +
      xlab("Sample") +
      ylab("TPM") +
      theme_minimal(base_size = input$fontsize) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
}
