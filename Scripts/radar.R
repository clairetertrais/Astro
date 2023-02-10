library(fmsb)

cara <- read.csv2("../Data/Tableau_qualités_signes.csv", sep=";")
signe <- "Poissons"
x <- cara[cara$signe == signe, ]
x <- x[, colSums(x == 0) == 0]
x <- x[, -1]
x <- rbind(rep(45,27) , rep(0,27) , x)
x <- data.frame(x)
radarchart( x  , axistype=1 , 
            
            #custom polygon
            pcol=rgb(0.2,0.5,0.5,0.9) , pfcol=rgb(0.2,0.5,0.5,0.5) , plwd=4 , 
            
            #custom the grid
            cglcol="grey", cglty=1, axislabcol="grey", caxislabels=seq(0,20,5), cglwd=0.8,
            
            #custom labels
            vlcex=0.8 
)

ex