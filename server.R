library(shiny)
library(dplyr)

#writing server function
shinyServer(function(input, output) {
  
  df_col <- reactive({
    #referring input p in ui.r as input$p
    if(input$radio_button=='Sepal Length'){
      i<-'Sepal.Length'
    }
    
    if(input$radio_button=='Sepal Width'){
      i<-'Sepal.Width'
    }
    
    if(input$radio_button=='Petal Length'){
      i<-'Petal.Length'
    }
    
    if(input$radio_button=='Petal Width'){
      i<-'Petal.Width'
    }
    
    x <- c(iris %>% select_(i)) %>% unlist
    return(x)
  })
  
  get_text <- reactive({
    
    if(is.null(input$title)) t <- ''
    else
      t <- input$title
    
    return(t)
    
  })
  
  get_x <- reactive({
    
    if(is.null(input$radio_button)) t <- ''
    else
      t <- input$radio_button
    
    return(t)
    
  })
  
  #referring output distPlot in ui.r as output$distPlot
  output$distPlot <- renderPlot({
    
    title <- get_text()
    x_name <- get_x()
    x <- df_col()
    #referring input bins in ui.r as input$bins
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    #producing histogram as output
    hist(x, breaks = bins, 
         col = 'red', xlab = x_name,
         border = 'white', main = title)
  })
})