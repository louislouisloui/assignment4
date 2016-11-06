#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cars data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectizeInput("cyl.select", "select cylinders", unique(mtcars[,"cyl"]), selected = c(4,6,8),multiple = TRUE),
       checkboxInput("regression","Regression lines")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Relation between Mpg, Hp and cylinders'),
      p('Select the cylinders you want to plot.'),
      p('If you want to visualize the regression, check the box.'),
       plotlyOutput("Plot")
    )
  )
))
