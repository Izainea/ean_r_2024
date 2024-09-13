## Instalar Libreria
install.packages("readr")

## Cargar Librería
library(readr)

## Cargar los datos
titanic <- read_csv("Datos/titanic.csv")

## Cargar  Excel
#install.packages("readxl")
#library(readxl)
#datos_excel<-read_excel("ruta_al_archivo.xlsx")

## Cargar Texto
#datos_texto <- read.table("ruta_al_archivo.txt")

## Cargar json
#install.packages("jsonlite")
#datos_json <- fromJSON("url.json")

# Ver estructura del datframe

str(titanic)

## Ver resumen

summary(titanic)

# Seleccionar columnas específicas
titanic_subset <- titanic[, c("Name", "Sex", "Age", "Survived")]
head(titanic_subset)

