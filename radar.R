#install.packages("fmsb") # permet d'installer le package
library(fmsb)

cara <- read.csv2("Tableau_qualités_signes.csv", sep=";")

x <- cara[cara$signe=="Poissons", ] #pour débug on donne une valeur à signe

#si <- unlist(x)

cara <- cara[,-c(1)] #essai pour enlever le signe dans le graph qui apparait comme une caractéristique
#cara <- as.data.frame(cara)
cara
cara <- cara[cara != 0]
cara <- data.frame(cara)
  #si <- si[si != 0]
#si <- data.frame(si)


radarchart(cara,  axistype = 2) #problème car les valeurs ne sont pas considérées comme numériques. 
#Essai de faire passer en data.frame mais pas concluant
#Tentative échouée 
