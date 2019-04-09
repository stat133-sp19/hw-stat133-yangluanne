
library(shiny)
library(ggplot2)
library(reshape2)

future_value <- function(amount, rate, years) {
  amount * (1 + rate)^years
}

annuity <- function(contrib, rate, years) {
  contrib * (((1 + rate)^years - 1) / rate)
}

growing_annuity <- function(contrib, rate, growth, years) {
  contrib * (((1 + rate)^years - (1 + growth)^years) / (rate - growth))
}


ui <- fluidPage(
  
  
  titlePanel("Saving/Investing Scenarios"),
   
  fluidRow(
    column(4, sliderInput(inputId = "init", "Initial Amount",
                          min = 1, max = 100000, step = 500,
                          value = 1000, pre = '$', 
                          sep = ','),
           
           sliderInput(inputId = "annual", "Annual Contribution",
                       min = 0, max =50000, step = 500,
                       value = 2000, pre = '$',
                       sep = ',')),
    
    column(4, sliderInput(inputId = "return", "Return Rate (in %)",
                          min = 0, max = 20, step = 0.1,
                          value = 5),
           
           sliderInput(inputId = "growth", "Growth Rate (in %)",
                       min = 0, max = 20, step = 0.1,
                       value = 2 )), 
    
    column(4, sliderInput(inputId = "years", "Years",
                          min = 0, max = 50, step = 1,
                          value = 20),
           
           selectInput(inputId = "facet", "Facet?", choices = c('No', 'Yes')))
    
  ),
  
  h4("Timelines"),
  plotOutput(outputId = "plot", height = 300),
  h4("Balances"),
  tableOutput(outputId = "table")
)



server <- function(input, output) {
  
  modality <- reactive({
      year <- 0:input$years
      no_contrib <- c()
      fixed_contrib <- c()
      growing_contrib <- c()
      
      for (i in year) {
        no_contrib <- c(no_contrib, future_value(input$init, input$return / 100, i))
        fixed_contrib <- c(fixed_contrib, future_value(input$init, input$return / 100, i) + annuity(input$init, input$return / 100, i))
        growing_contrib <- c(growing_contrib, future_value(input$init, input$return / 100, i) + growing_annuity(input$annual, input$return / 100, input$growth / 100, i))
      }
      
      return(data.frame(
        year = year,
        no_contrib = no_contrib,
        fixed_contrib = fixed_contrib,
        growing_contrib = growing_contrib))

  })
  
  output$plot <- renderPlot({
    
    tab <- melt(modality(), id.vars="year")
    
    if (input$facet == "No") {
      
      ggplot(tab, aes(year, value, col=variable)) + 
        geom_line(size = 1) + geom_point() + 
        theme_minimal() + ggtitle("Three modes of investing")
      
    } else {
      ggplot(tab, aes(year, value, col=variable, fill=variable)) + 
        geom_line(size = 1) + geom_point() + 
        geom_area(alpha = 0.4) + facet_grid(~ variable) +
        theme_minimal() + ggtitle("Three modes of investing")
    }
    
  })
  
  output$table <- renderTable({
    modality()
  })
}


shinyApp(ui = ui, server = server)

