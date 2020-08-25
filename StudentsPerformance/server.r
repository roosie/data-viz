# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  StudentPerformance = read.csv('StudentsPerformance_cleaned.csv', header=T)
  
  output$distPlot <- renderPlot({
    
    x_val <- NULL
    x_name <- NULL
    
    if(input$`X Score` == "Math"){
      x_val = StudentPerformance$math.score
      x_name = "Math"
    }
    else if(input$`X Score` == "Reading"){
      x_val = StudentPerformance$reading.score
      x_name = "Reading"
    } 
    else if(input$`X Score` == "Writing"){
      x_val = StudentPerformance$writing.score
      x_name = "Writing"
    } 
    
    
    y_val <- NULL
    y_name <- NULL
    if(input$`Y Score` == "Math"){
      y_val = StudentPerformance$math.score
      y_name = "Math"
    }
    else if(input$`Y Score` == "Reading"){
      y_val = StudentPerformance$reading.score
      y_name = "Reading"
    } 
    else if(input$`Y Score` == "Writing"){
      y_val = StudentPerformance$writing.score
      y_name = "Writing"
    } 
    
    legend_color = NULL
    c_leg <- c("Group A", "Group B", "Group C", "Group D", "Group E")
    colors <- NULL
    if(input$`Color Code` == "Ethnicity"){
      legend_color <- c("#00AFBB", "#E7B800", "#FC4E07", "#FFFFFF", "burlywood")
      colors <- c("#00AFBB", "#E7B800", "#FC4E07", "#FFFFFF", "burlywood")
      colors <- colors[as.numeric(StudentPerformance$race.ethnicity)]
      c_leg <- c("Group A", "Group B", "Group C", "Group D", "Group E")
    }
    else if(input$`Color Code` == "Test Prep"){
      legend_color <- c("#00AFBB", "red")
      colors <- c("red", "green")
      colors <- colors[as.numeric(StudentPerformance$test.preparation.course)]
      c_leg <- c("None", "Completed")
    }
    else if(input$`Color Code` == "Parent's Education"){
      legend_color <- c("#00AFBB", "#E7B800", "#FC4E07", "#FFFFFF", "burlywood", "yellow")
      colors <- c("#00AFBB", "#E7B800", "#FC4E07", "#FFFFFF", "burlywood", "yellow")
      colors <- colors[as.numeric(StudentPerformance$parental.level.of.education)]
      c_leg <- c("bachelor's degree" , "some college"  ,     "master's degree"  ,  "associate's degree",  "high school"     ,   "some high school" )
    }
    else if(input$`Color Code` == "Lunch"){
      legend_color <- c("green","red")
      colors <- c("green","red")
      colors <- colors[as.numeric(StudentPerformance$lunch)]
      c_leg <- c("Standard", "Free/Reduced")
    }
    
    shapes <- NULL
    leg = NULL
    if(input$`Shapes` == "Ethnicity"){
      shapes <- c(14,15,16, 17, 18)
      leg <- c("Group A", "Group B", "Group C", "Group D", "Group E")
    }
    else if(input$`Shapes` == "Test Prep"){
      shapes <- c(16,17)
      leg <- c("None", "Completed")
    }
    else if(input$`Shapes` == "Parent's Education"){
      shapes <- c(14,15,16, 17, 18,19)
      leg <- c("bachelor's degree" , "some college"  ,     "master's degree"  ,  "associate's degree",  "high school"     ,   "some high school" )
    }
    else if(input$`Shapes` == "Lunch"){
      shapes <- c(16,17)
      leg <- c("Standard", "Free/Reduced")
    }
    
    plot(x = x_val, y_val, frame = FALSE,
         xlab = x_name, ylab = y_name,
         col = colors, pch = shapes)
    leg = c(c_leg, leg)
    i = 0
    while(length(leg) > i){ 
      legend_color = c(legend_color, "black")
      i = i + 1 }
    legend("topleft", 
           legend = leg, 
           pch = shapes, 
           col = legend_color,
           bty = "n", 
           pt.cex = 2, 
           cex = 1.2,
           text.col = "black", 
           horiz = F , 
           inset = c(0.1, 0.1))
    
  })


  
}