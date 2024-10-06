library(readxl)

file_path <- "BostonHousing.xlsx"

data<-read_excel(file_path,sheet='Data')

data

summary(data)

## Descripción de variables


###

above_30k <- data[data$MEDV >= 30,]
below_30k <- data[data$MEDV < 30,]

#####

summary_below_mean <- sapply(below_30k[,c("CRIM","RM","DIS","RAD")],mean,na.rm=TRUE)

summary_below_std <- sapply(below_30k[,c("CRIM","RM","DIS","RAD")],sd,na.rm=TRUE)

summary_below_percentiles <- sapply(below_30k[,c("CRIM","RM","DIS","RAD")],quantile,probs=c(0,0.25,0.5,0.75,1),na.rm=TRUE)

summary_above_mean <- sapply(above_30k[,c("CRIM","RM","DIS","RAD")],mean,na.rm=TRUE)

summary_above_std <- sapply(above_30k[,c("CRIM","RM","DIS","RAD")],sd,na.rm=TRUE)

summary_above_percentiles <- sapply(above_30k[,c("CRIM","RM","DIS","RAD")],quantile,probs=c(0,0.25,0.5,0.75,1),na.rm=TRUE)

print("media below:")
print(summary_below_mean)

print("media above:")
print(summary_above_mean)

print("----------------------------")


print("sd below:")
print(summary_below_std)

print("sd above:")
print(summary_above_std)

print("----------------------------")


print("percentiles below:")
print(summary_below_percentiles)

print("percentile above:")
print(summary_above_percentiles)


comparison <- data.frame(Variable=c("CRIM","RM","DIS","RAD"),
                         Above_30k=summary_above_mean,
                         Below_30k=summary_below_mean)
comparison


t_test_CRIM <- t.test(above_30k$CRIM,below_30k$CRIM, var.equal = FALSE)
t_test_CRIM


################## 3....

##################4. cor

cor_matrix <- cor(data, use = "complete.obs")
cor_matrix[,"MEDV"]


top_predictors <- names(sort(abs(cor_matrix[,"MEDV"]), decreasing = TRUE)[3:6])

library(ggplot2)

for (predictor in top_predictors) {
  print(
    ggplot(data, aes_string(x = predictor, y = "MEDV")) +
      geom_point() +
      geom_smooth(method = "lm", col = "blue") +
      labs(title = paste("Correlación entre", predictor, "y MEDV")) +
      theme_minimal()
  )
}

modelo <- lm(MEDV ~ CRIM+ZN+NOX+RM+DIS+RAD+TAX+PTRATIO + LSTAT, data = data)

summary(modelo)
