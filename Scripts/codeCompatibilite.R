textOutput("compatibilite"),
h2("Voici ta compatibilité amoureuse :")



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
