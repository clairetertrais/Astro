library(shiny)
#install.packages("plotly")
library(plotly)

ui <- fluidPage(
  titlePanel("Tout savoir sur soi grâce à sa date de naissance !"),
  sidebarLayout(
    sidebarPanel(
      dateInput("date", "Entrez votre date de naissance :", value = Sys.Date(), format = "dd/mm/yyyy"),
      submitButton("Continuez"),
    ),
    mainPanel(
      textOutput("signeastro"),
      h1("Description:"),
      textOutput("description"),
      h2("Signe Chinois :"),
      textOutput("signe_chinois"),
      h2("Voici ta compatibilité amoureuse :"),
      textOutput("compatibilite"),
      h2("Voici tes traits de caractères principaux :"),
      plotlyOutput("pie"),
      uiOutput("horoscope"),
      h2("Votre horoscope du jour :")
    )
  )
)


server <- function(input, output) {

  #Connaître son signe astrologique 
  
  signe <- reactive({
    jour <- as.integer(format(input$date, "%d"))
    mois <- as.integer(format(input$date, "%m"))
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
  
  output$signeastro <- renderText({
    paste ("Votre signe astrologique est : ", signe())
    })
  
  #Avoir la description de son signe astro
  
  output$description <- renderText({
    jour <- as.integer(format(input$date, "%d"))
    mois <- as.integer(format(input$date, "%m"))
    description <- ""
    if ((mois == 3 & jour >= 21) || (mois == 4 & jour <= 19)) {
      description <- "Le Bélier est le 1er signe du zodiaque. Il est rattaché à l'élément feu. C'est un signe d'énergie et d'enthousiasme. Le bélier fait preuve d'initiative, d'audace et d'ambition. Il est indépendant, direct et fait preuve de combativité. Il peut parfois se montrer peu diplomate et agressif."
    } else if ((mois == 4 & jour >= 20) || (mois == 5 & jour <= 20)) {
      description <- "Le Taureau est le 2ème signe du zodiaque. Il est associé à l'élément terre. Le taureau est le signe le plus stable du zodiaque. Il est prudent, timide et travailleur. Son besoin de sécurité peut facilement l'amener à être possessif et jaloux."
    } else if ((mois == 5 & jour >= 21) || (mois == 6 & jour <= 20)) {
      description <- "Le signe des Gémeaux est le 3ème signe du zodiaque. Il est associé à l'élément air. C'est un signe de communication, compréhension et adaptation. Les gémeaux sont débrouillards, curieux et sociables. Ils devront toutefois surveiller leur nervosité et veiller à ne pas trop se disperser"
    } else if ((mois == 6 & jour >= 21) || (mois == 7 & jour <= 22)) {
      description <- "Le Cancer est le 4ème signe du zodiaque. Il est associé à l'élément eau. C'est un signe sensible, romantique et fragile. Les cancers sont généreux et attachent de l'importance à la famille. Leur extrême sensibilité peut les amener à se vexer et à être dans l'émotivité."
    } else if ((mois == 7 & jour >= 23) || (mois == 8 & jour <= 22)) {
      description <- "Le Lion occupe la 5ème place dans le zodiaque. Il est rattaché à l'élément feu. C'est un signe de création, d'orgueil et d'ambition. Sa personnalité chaleureuse et généreuse contraste avec son autoritarisme et sa fierté."
    } else if ((mois == 8 & jour >= 23) || (mois == 9 & jour <= 22)) {
      description <- "La Vierge est le 6ème signe du zodiaque. Il est lié à l'élément terre. C'est un signe de raison, de logique, d'analyse. Les vierges sont serviables et délicates. Leur perfectionnisme peut les amener à être tatillon, têtu voir inflexible."
    } else if ((mois == 9 & jour >= 23) || (mois == 10 & jour <= 22)) {
      description <- "La Balance est le 7ème signe du zodiaque. Il est associé à l'élément air. C'est un signe d'équilibre, de justice, de paix. D'un tempérament tranquille les balances font preuve de courtoisie, de sociabilité, de douceur et de mesure. Leurs principaux défauts sont l'indécision, le manque d'initiative et la dépendance aux autres."
    } else if ((mois == 10 & jour >= 23) || (mois == 11 & jour <= 21)) {
      description <- "Le Scorpion occupe la 8ème place dans le zodiaque. Il est rattaché à l'élément eau. C'est le signe le plus passionné du zodiaque. Les scorpions vivent intensément leurs émotions. Ils sont tenaces, lucides et anticonformistes. Ce signe en constante évolution peut faire preuve de possessivité et d'agressivité."
    } else if ((mois == 11 & jour >= 22) || (mois == 12 & jour <= 21)) {
      description <- "Le Sagittaire est le 9ème signe du zodiaque. Il est associé à l'élément feu. C'est un signe de sagesse, de sérénité et d'optimisme. Les sagittaires sont chaleureux, enthousiastes, généreux et courageux. Leur besoin d'aventure et de compétivité peut les amener à être instable, impatient et impulsif."
    } else if ((mois == 12 & jour >= 22) || (mois == 1 & jour <= 19)) {
      description <- "10ème signe du zodiaque, le Capricorne est lié à l'élément terre. C'est un signe de logique, de prudence. Les capricornes font preuve de patience, de sang-froid et de ténacité. Ils ont du mal à faire confiance et leur besoin de distanciation peut parfois les amener à être considéré comme égoïste."
    } else if ((mois == 1 & jour >= 20) || (mois == 2 & jour <= 18)) {
      description <- "Le Verseau est le 11ème signe du zodiaque. Il est rattaché à l'élément air. C'est un signe de paradoxe. Il fait à la fois ouvert aux autres tout en cherchant à garder sa singularité et son indépendance. Les verseaux sont curieux, coopératifs et capable de s'adapter à toutes les situations. Ils peuvent se montrer imprévisibles et individualistes."
    } else if ((mois == 2 & jour >= 19) || (mois == 3 & jour <= 20)) {
      description <- "Le signe astrologique des Poissons est le 12ème et dernier signe du zodiaque. Il est lié à l'élément eau. Ce signe se caractérise par sa générosité, sa sensibilité et son intuition. Son empathie peut l'amener à se montrer anxieux, fragile et indécis."
    }
    paste("", description)
  })
  

  # Connaître son signe chinois
  
  output$signe_chinois <- renderText({
    annee <- as.integer(format(input$date, "%Y"))
    signe_chinois <- ""
    if ((annee - 1900) %% 12 == 0) {
      signe_chinois <- "Rat"
    } else if ((annee - 1900) %% 12 == 1) {
      signe_chinois <- "Buffle"
    } else if ((annee - 1900) %% 12 == 2) {
      signe_chinois <- "Tigre"
    } else if ((annee - 1900) %% 12 == 3) {
      signe_chinois <- "Lapin"
    } else if ((annee - 1900) %% 12 == 4) {
      signe_chinois <- "Dragon"
    } else if ((annee - 1900) %% 12 == 5) {
      signe_chinois <- "Serpent"
    } else if ((annee - 1900) %% 12 == 6) {
      signe_chinois <- "Cheval"
    } else if ((annee - 1900) %% 12 == 7) {
      signe_chinois <- "Chèvre"
    } else if ((annee - 1900) %% 12 == 8) {
      signe_chinois <- "Singe"
    } else if ((annee - 1900) %% 12 == 9) {
      signe_chinois <- "Coq"
    } else if ((annee - 1900) %% 12 == 10) {
      signe_chinois <- "Chien"
    } else if ((annee - 1900) %% 12 == 11) {
      signe_chinois <- "Porc"
    }
    paste("Ton signe chinois est :", signe_chinois)
  })

  
  #Connaître sa compatibilité amoureuse
  
  output$compatibilite <- renderText({
    compatibilite <- ""
    if (signe()=="Bélier") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Sagittaire,vous connaitrez la passion. Avec le Taureau vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Lion, qui ne tente rien n'a rien ! "
    } else if (signe()=="Taureau") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Capricorne,vous connaitrez la passion. Avec le Scorpion vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Bélier, qui ne tente rien n'a rien ! "
    } else if (signe()=="Gémeaux") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Gémeaux,vous connaitrez la passion. Avec la Vierge vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Sagittaire, qui ne tente rien n'a rien ! "
    } else if (signe()=="Cancer") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Lion,vous connaitrez la passion. Avec la Vierge vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Capricorne, qui ne tente rien n'a rien ! "
    } else if (signe()=="Lion") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Sagittaire,vous connaitrez la passion. Avec la Balance vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Bélier, qui ne tente rien n'a rien ! "
    } else if (signe()=="Vierge") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Capricorne,vous connaitrez la passion. Avec le Taureau vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Cancer, qui ne tente rien n'a rien ! "
    } else if (signe()=="Balance") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Lion,vous connaitrez la passion. Avec le Taureau vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Bélier, qui ne tente rien n'a rien ! "
    } else if (signe()=="Scorpion") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Cancer,vous connaitrez la passion. Avec le Taureau vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Capricorne, qui ne tente rien n'a rien ! "
    } else if (signe()=="Sagittaire") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Lion,vous connaitrez la passion. Avec le Bélier vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Gémeaux, qui ne tente rien n'a rien ! "
    } else if (signe()=="Capricorne") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Capricorne,vous connaitrez la passion. Avec le Taureau vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Scorpion, qui ne tente rien n'a rien ! "
    } else if (signe()=="Verseau") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Sagittaire,vous connaitrez la passion. Avec le Verseau vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec le Scorpion, qui ne tente rien n'a rien ! "
    } else if (signe()=="Poissons") {
      compatibilite <- "Votre meilleure compatibilité amoureuse est avec le Scorpion,vous connaitrez la passion. Avec le Cancer vous avez une bonne compatibilité, à exploiter. Enfin, ça peut toujours marcher avec la Vierge, qui ne tente rien n'a rien ! "
    }
    paste("",compatibilite)
  })  
  
  
  #Connaître ses traits de caractère
  
  output$pie <- renderPlotly({
    
    cara <- read.csv2("../Data/Tableau_qualités_signes.csv", sep=";", row.names=1)
    
    x <- cara[rownames(cara)==signe(), ]
   #x <- cara[rownames(cara)=="Cancer", ] #pour débug on donne une valeur à signe
    si <- unlist(x)
    si <- si[si != 0] #on enlève tous les caractères à 0
    
    # Graphique
    plot_ly(theta = names(si),
            r = si,
            type = "scatterpolar",
            fill = 'toself'
    )
  })
  
  
  #Horoscope
  
  output$horoscope <- renderText({
    url <- a("Horoscope du jour", href="https://www.evozen.fr/horoscope/horoscope-du-jour")
    output$horoscope <- renderUI({
      paste("Votre horoscope du jour, cliquez sur le lien pour en savoir plus", url)
    })
  })
  
}

shinyApp(ui, server)
