
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
  