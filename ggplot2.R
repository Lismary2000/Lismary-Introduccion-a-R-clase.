
hjust# 1 de octubre del 2026 ---------------------------------------------------


library(ggplot2)
tyre <- read.csv("tyre.csv")
books <- read.csv("books.csv")
summary(tyre)

colores= c("pink", "violet", "purple", "darkred")

ggplot(data=tyre,
       aes(x=Brands, y=Mileage)) +
#geom_boxplot(aes(fill=Brands)) + como lo hice sin cambiar los colores
  geom_boxplot(fill=colores) +
  labs(title= "Marcas de llantas y  cuanto aguantan",
       x= "Marcas Caras",
       y= "Millas") +  theme_bw() +
theme(legend.position = 'none')

theme(
  plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
  axis.title.x = element_text(size = 14, face = "bold"),
  axis.title.y = element_text(size = 14, face = "bold"),
  axis.text.x = element_text(size = 12),
  axis.text.y = element_text(size = 12),
)
plot()
# Statistical analysis brands ---------------------------------------------
# F value significa diferencia entre valores entre mas alto el F value mayor diferencia 
mod <- aov(Mileage ~Brands, data=tyre)
summary(mod)
# DF= groups-1, or obcserve-groups

resid_anova <- residuals(mod)
shapiro.test(resid_anova)

# shapiro compara los datos con una  distribusion normal 
# p-valuelager than 0.05 => your data are not sig.  =/  from a normal distribution.
#step 1 = 0 create a model aov()
#step 2 => check for normality de los residuals
#step 3 = Tukey test

TukeyHSD(mod)
plot(TukeyHSD(mod))


plot= ggplot(data=tyre,
       aes(x=Brands, y=Mileage)) +
  #geom_boxplot(aes(fill=Brands)) + como lo hice sin cambiar los colores
  geom_boxplot(fill=colores) +
  labs(title= "Marcas de llantas y  cuanto aguantan",
       x= "Marcas Caras",
       y= "Millas") +  theme_bw() +
  theme(legend.position = 'none')

plot
ggsave(
  filename = "Mileage_by_Brand.png",
  plot= plot,
  width = 8, height = 6, dpi = 300)
