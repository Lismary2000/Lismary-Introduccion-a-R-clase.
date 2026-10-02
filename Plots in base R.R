
# Plots in Base R: Barplots -----------------------------------------------

# Load dataset
data(DNase)
head(DNase, 3)

mean_density <- aggregate(density~conc,
                          data=DNase,
                          FUN=mean)
mean_density

barplot(
  height = mean_density$density, 
  names.arg = mean_density$conc,
  col = "pink",
  border = "gray30", 
  main = "Mean DNase I Activity by Concentration",
  xlab = "Concentration (mg/mL)",
  ylab = "Mean Optical Density", 
  cex.names = 0.8
)

# 29 de septiembre del 2026 -----------------------------------------------
install.packages("readxl")
library(readxl)
coronary<- read_excel("coronary.xlsx")
head(coronary)

plot(coronary$dbp ~ coronary$chol,
type = "p",           
col = "purple",                    
xlim= c(4,10),
ylim= c(40,140),
xlab = "Total Cholesterol (mmol/L)",  
ylab = "Diastolic Blood Pressure (mmHg)", 
)

abline(lm(dbp ~ chol, data = coronary),
     col= "green", lwd = 2, lty = 1 )

spearman_result <- cor.test(
  coronary$chol,
  coronary$dbp,
  method = "spearman",
  exact = FALSE
)
spearman_result

# es un valor significativo porque el p <0.005
#rho es la fortalesa de la relacion
#Pearson corr.=> Parametre
#Spearman Corr.=> Non Parametric Stats

shapiro.test(coronary$chol) # $ es tienes que tomar la informacion de este  set de datos 
shapiro.test(coronary$dbp)
#en shapiro valores de p bajos  significa que tine una curva de campana 
hist(coronary$dbp)
hist(coronary$chol, col = "pink")

coronary <- coronary[order(coronary$age), ]
# Gráfico de líneas básico
plot(coronary$age, coronary$agel,
     type = "l", # "l" = line plot
     col = "darkviolet",
     lwd = 2,
     xlab = "Age (years)",
     ylab = "Cholesterol (mmol/L)",
     main = "Cholesterol vs Age")

boxplot(coronary$chol,
        main = "Cholesterol Levels",
        ylab = "Cholesterol (mmol/L)",
        col  = "pink",
        border = "darkred"
)

