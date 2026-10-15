

install.packages("lessR")
library(lessR)

fish <- read.csv("fish_data.csv")
head(fish)

hist(fish$Length)

pivot(fish, c(IQR, skew, kurtosis,max, 
              min, mean, sd, var), Length)


# Quantiles ---------------------------------------------------------------

q25 <- quantile(fish$Length,prob=(0.25))
q75 <- quantile(fish$Length,prob=(0.75))

iqr <- q75 - q25
lower <- q25 - (1.5*iqr)
upper <- q75 + (1.5*iqr)

iqr
lower
upper

shapiro.test(fish$Weight)

boxplot(fish$Length)
