library(readxl)

file_path <- "data_ejercicio.xlsx"

data<-read_excel(file_path)

data

summary(data)

data$residuos <- data$`Points/Game`-data$`Predicted Values`

library(ggplot2)

ggplot(data, aes(x=residuos))+
  geom_histogram(aes(y=..density..),bins=15,fill="green",alpha=0.5)+
  geom_density(col="blue")+
  labs(title = "Histograma de residuos",
       x="Residuos",
       y="Densidad")

qqnorm(data$residuos)
qqline(data$residuos, col="red")


ggplot(data, aes(x=`Predicted Values`,y=residuos))+
  geom_point()+
  geom_hline(yintercept = 0,color = "orange",linetype="dashed")+
  labs(title = "Homocedasticidads",
       x="Predichos",
       y="Residuos")


plot(data$residuos, type = "o", pch=16,col="blue",
     main="Independencia",
     xlab="Orden",
     ylab="Residuos")
abline(h=0,col="red",lty=2)