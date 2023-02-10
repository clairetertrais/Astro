library(fmsb)

cara <- read.csv2("Tableau_qualités_signes.csv", sep=";")

# Demander à l'utilisateur de choisir un signe astrologique
signe <- "Cancer"


# Sélectionner les données pour le signe choisi
x <- cara[cara$signe == signe, ]

# Supprimer les colonnes qui ont une valeur égale à 0
x <- x[, colSums(x == 0) == 0]

# Enlever la première colonne (signe)
x <- x[, -1]

x <- rbind(rep(45,27) , rep(0,27) , x)

# Transformer les données en data.frame
x <- data.frame(x)


# Générer le diagramme en radar
radarchart( x  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)
