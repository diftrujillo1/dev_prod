library(shiny)
library(markdown)

shinyUI(
  navbarPage("Exploring Iris Dataset",
             tabPanel("Shiny App",
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("radio_button", "Select column of iris dataset:",
                                       list("Sepal.Length"='Sepal Length', 
                                            "Sepal.Width"='Sepal Width', 
                                            "Petal.Length"='Petal Length', 
                                            "Petal.Width"='Petal Width')),
                          
                          sliderInput("bins",
                                      "Number of bins:",
                                      min = 1,
                                      max = 50,
                                      value = 30),
                          
                          textInput("title", "Give a title to the chart", "Title"),
                          submitButton("Update View", icon("refresh"))
                        ),
                        mainPanel(
                          plotOutput("distPlot")
                        )
                      )
             ),
             tabPanel("More Info",
                      mainPanel(
                        includeMarkdown("info.Rmd"))
             )
  )
)
