library(shiny)

ui <- fluidPage(
  titlePanel("Déterminer son signe astrologique"),
  sidebarLayout(
    sidebarPanel(
      dateInput("date", "Entrez votre date de naissance :", value = Sys.Date(), format = "dd/mm/yy"),
      submitButton("Submit")
    ),
    mainPanel(
      textOutput("signe")
    )
  )
)

server <- function(input, output) {
  output$signe <- renderText({
    jour <- as.integer(format(input$date, "%d"))
    mois <- as.integer(format(input$date, "%m"))
    signe <- ""
    if ((mois == 3 & jour >= 21) || (mois == 4 & jour <= 19)) {
      signe <- "Bélier"
    } else if ((mois == 4 & jour >= 20) || (mois == 5 & jour <= 20)) {
      signe <- "Taureau"
    } else if ((mois == 5 & jour >= 21) || (mois == 6 & jour <= 20)) {
      signe <- "Gémeaux"
    } else if ((mois == 6 & jour >= 21) || (mois == 7 & jour <= 22)) {
      signe <- "Cancer"
    } else if ((mois == 7 & jour >= 23) || (mois == 8 & jour <= 22)) {
      signe <- "Lion"
    } else if ((mois == 8 & jour >= 23) || (mois == 9 & jour <= 22)) {
      signe <- "Vierge"
    } else if ((mois == 9 & jour >= 23) || (mois == 10 & jour <= 22)) {
      signe <- "Balance"
    } else if ((mois == 10 & jour >= 23) || (mois == 11 & jour <= 21)) {
      signe <- "Scorpion"
    } else if ((mois == 11 & jour >= 22) || (mois == 12 & jour <= 21)) {
      signe <- "Sagittaire"
    } else if ((mois == 12 & jour >= 22) || (mois == 1 & jour <= 19)) {
      signe <- "Capricorne"
    } else if ((mois == 1 & jour >= 20) || (mois == 2 & jour <= 18)) {
      signe <- "Verseau"
    } else if ((mois == 2 & jour >= 19) || (mois == 3 & jour <= 20)) {
      signe <- "Poissons"
    }
    paste("Votre signe astrologique est :", signe)
  })
}

shinyApp(ui, server)
