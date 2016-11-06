#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$selectIndex <-  renderText({input$cyl.select})
  dt <- reactive ({tbl_df(mtcars) %>% filter(cyl %in% input$cyl.select)})
  output$Plot <- renderPlotly({
    dt <-  dt()
    g <- ggplot(data = dt, aes(x = dt$hp, y = dt$mpg, color = as.factor(dt$cyl))) +  geom_point()+ labs(title = "Miles per galon by horespower", x = "Hp", y="Mpg")
    if (input$regression) {
    g <- g + geom_smooth(method = "lm", se = FALSE) 
    }
    
    ggplotly(g)
    
    })
  
})
