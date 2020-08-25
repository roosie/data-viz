# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Student Performance"),
  
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Selector for choosing dataset ----
      selectInput(inputId = "X Score",
                  label = "Choose X:",
                  choices = c("Math", "Reading", "Writing")),
      selectInput(inputId = "Y Score",
                  label = "Choose Y:",
                  choices = c("Reading", "Writing", "Math")),
      selectInput(inputId = "Color Code",
                  label = "Color Code:",
                  choices = c("Ethnicity", "Parent's Education", "Lunch", "Test Prep")),
      selectInput(inputId = "Shapes",
                  label = "Shapes:",
                  choices = c("Parent's Education", "Lunch", "Test Prep","Ethnicity"))
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)
