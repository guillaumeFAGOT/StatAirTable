#To check where your R home is, try normalizePath("~").
# Creation d un fichier d environnement dans le R home qui contient la clef API de Airtable pour cette table.
#(base) guillaume@guillaume-Latitude-E5400:~$ more .Renviron
# Aller sur le lien suivant pour accéder à l'API page https://airtable.com/account (la clef API est à copier coller)
#AIRTABLE_API_KEY=XXXXXXXXXX

install.packages(c("FactoMineR", "factoextra"))
library("FactoMineR")
library("factoextra")
devtools::install_github("bergant/airtabler")
library(airtabler)

DataMarket <-
  airtable(
    base = "appaRl8stOXF4uBUG",
    tables = c("DataMarketing")
  )

BDD<-DataMarket$DataMarketing$select()
BDD_pour_PCA<-BDD[,2:12]
summary(BDD_pour_PCA)
res.pca<-PCA(BDD_pour_PCA, scale.unit = TRUE, ncp = 5, graph = TRUE)
fviz_pca_ind (res.pca)

