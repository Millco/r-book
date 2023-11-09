library(shiny)
library(maps)
library(mapproj)
source("shiny_tut/helpers.R")
counties <- readRDS("shiny_tut/data/counties.rds")

# runExample("01_hello")

# app.R has three components: UI, server function, call to shinyApp function

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  titlePanel("Cathackk US Census!"),

 sidebarLayout(
   sidebarPanel(
     p("Create demographic maps with Information from the 2010 US Census"),
   selectInput("ethnicity", strong("Choose a variable to display"),
               choices = list("Percent White",
                              "Percent Black",
                              "Percent Hispanic",
                              "Percent Asian")),
   sliderInput("range_int", strong("Range of Interest"),
                                   min = 0,
                                   max = 100, value = c(0, 100))
   ),
   mainPanel(
     plotOutput("map")
   )
 )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$map <- renderPlot({
    args <- switch(input$ethnicity,
                   "Percent White" = list(counties$white, "black", input$ethnicity),
                   "Percent Black" = list(counties$black, "darkblue", input$ethnicity),
                   "Percent Hispanic" = list(counties$hispanic, "darkorange", input$ethnicity),
                   "Percent Asian" = list(counties$asian, "darkviolet", input$ethnicity)
                   )
    args$min <- input$range_int[1]
    args$max <- input$range_int[2]
    do.call(percent_map, args)
  })

}

shinyApp(ui = ui, server = server)

# https://shiny.rstudio.com/tutorial/written-tutorial/lesson4/
