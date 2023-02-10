#CompAmour
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("signe", "Choisissez un signe:", c("Bélier", "Taureau", "Gémeaux", "Cancer", 
                                                     "Lion", "Vierge", "Balance", "Scorpion", 
                                                     "Sagittaire", "Capricorne", "Verseau", "Poissons"))
    ),
    mainPanel(
      tableOutput("compatibilite_table")
    )
  )
)

server <- function(input, output) {
  data <- data.frame(signe = c("Bélier", "Taureau", "Gémeaux", "Cancer", "Lion", "Vierge", 
                               "Balance", "Scorpion", "Sagittaire", "Capricorne", "Verseau", "Poissons"),
                     Meilleure = c("Sagittaire", "Capricorne", "Gémeaux", "Lion", "Sagittaire", 
                                      "Capricorne", "Lion", "Cancer", "Lion", "Capricorne", "Sagittaire", "Scorpion"),
                     Bonne = c("Taureau", "Scorpion", "Vierge", "Vierge", "Balance", "Taureau", 
                                   "Taureau", "Taureau", "Bélier", "Taureau", "Verseau", "Cancer"),
                     Possible = c("Lion", "Bélier", "Sagittaire", "Capricorne", "Bélier", "Cancer", 
                                     "Bélier", "Capricorne", "Gémeaux", "Scorpion", "Scorpion", "Vierge"))
  
  filtered_data <- reactive({
    data[data$signe == input$signe, c("Meilleure", "Bonne", "Possible")]
  })
  
  output$compatibilite_table <- renderTable({
    filtered_data()
  })
}

shinyApp(ui, server)

