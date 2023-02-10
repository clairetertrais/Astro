library(shiny)
library(plotly)

ui <- fluidPage(
  titlePanel("Déterminer son signe astrologique"),
  sidebarLayout(
    sidebarPanel(
      dateInput("date", "Entrez votre date de naissance :", value = Sys.Date(), format = "dd/mm/yyyy"),
      submitButton("Submit")
    ),
    mainPanel(
      textOutput("signe"),
      h1("Description:"),
      h2 ("Voici tes traits de caractères principaux :"),
      plotlyOutput("pie")
    )
  )
)

server <- function(input, output) {
  
  signe <- reactive({
    jour <- as.integer(format(input$date, "%d"))
    mois <- as.integer(format(input$date, "%m"))
    signe <- ""
    if ((mois == 3 & jour >= 21) || (mois == 4 & jour <= 19)) {
      "Bélier"
    } else if ((mois == 4 & jour >= 20) || (mois == 5 & jour <= 20)) {
      "Taureau"
    } else if ((mois == 5 & jour >= 21) || (mois == 6 & jour <= 20)) {
      "Gémeaux"
    } else if ((mois == 6 & jour >= 21) || (mois == 7 & jour <= 22)) {
      "Cancer"
    } else if ((mois == 7 & jour >= 23) || (mois == 8 & jour <= 22)) {
      "Lion"
    } else if ((mois == 8 & jour >= 23) || (mois == 9 & jour <= 22)) {
      "Vierge"
    } else if ((mois == 9 & jour >= 23) || (mois == 10 & jour <= 22)) {
      "Balance"
    } else if ((mois == 10 & jour >= 23) || (mois == 11 & jour <= 21)) {
      "Scorpion"
    } else if ((mois == 11 & jour >= 22) || (mois == 12 & jour <= 21)) {
      "Sagittaire"
    } else if ((mois == 12 & jour >= 22) || (mois == 1 & jour <= 19)) {
      "Capricorne"
    } else if ((mois == 1 & jour >= 20) || (mois == 2 & jour <= 18)) {
      "Verseau"
    } else if ((mois == 2 & jour >= 19) || (mois == 3 & jour <= 20)) {
      "Poissons"
    }
  })
  
  
  
  
  output$pie <- renderPlotly({
    
    cara <- read.csv2("../Data/Tableau_qualités_signes.csv", sep=";")
    
    x <- cara[cara$signe==signe(), ]
    si <- unlist(x)
    
    # Graphique
    camembert <- plot_ly(labels = names(si), 
                         values = si, type = "pie")
    
  })
  
  
}

shinyApp(ui, server)