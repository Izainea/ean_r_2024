
# Cargar librerías necesarias
library(ggplot2)
library(DescTools)
library(moments)

# Cargar el dataset titanic desde 'Datos/titanic.csv'
titanic <- read.csv('Datos/titanic.csv')

# 1. Medidas Estadísticas

# a. Medidas de tendencia central

# Media
media_edad <- mean(titanic$age, na.rm = TRUE)
print(paste("Media de la edad:", media_edad))

# Mediana
mediana_edad <- median(titanic$age, na.rm = TRUE)
print(paste("Mediana de la edad:", mediana_edad))

# Moda
moda_edad <- Mode(titanic$age, na.rm = TRUE)
print(paste("Moda de la edad:", moda_edad))

# b. Medidas de dispersión

# Varianza
varianza_edad <- var(titanic$age, na.rm = TRUE)
print(paste("Varianza de la edad:", varianza_edad))

# Desviación estándar
desviacion_estandar_edad <- sd(titanic$age, na.rm = TRUE)
print(paste("Desviación estándar de la edad:", desviacion_estandar_edad))

# Rango intercuartílico
rango_intercuartilico_edad <- IQR(titanic$age, na.rm = TRUE)
print(paste("Rango intercuartílico de la edad:", rango_intercuartilico_edad))

# c. Asimetría y curtosis

# Curtosis
curtosis_edad <- kurtosis(titanic$age, na.rm = TRUE)
print(paste("Curtosis de la edad:", curtosis_edad))

# Asimetría
asimetria_edad <- skewness(titanic$age, na.rm = TRUE)
print(paste("Asimetría de la edad:", asimetria_edad))

# 2. Visualizaciones con ggplot2

# a. Gráfico de dispersión entre edad y tarifa
ggplot(titanic, aes(x = age, y = fare)) +
  geom_point() +
  labs(title = "Relación entre Edad y Tarifa",
       x = "Edad",
       y = "Tarifa")

# b. Histograma de la variable edad
ggplot(titanic, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Distribución de la Edad", x = "Edad", y = "Frecuencia")

# c. Boxplot de la edad por clase de pasajero
ggplot(titanic, aes(x = as.factor(pclass), y = age)) +
  geom_boxplot() +
  labs(title = "Distribución de Edad por Clase",
       x = "Clase del Pasajero",
       y = "Edad")
