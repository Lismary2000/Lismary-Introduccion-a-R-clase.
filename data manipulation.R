

# Data-Manipulation dplyr -------------------------------------------------


install.packages('dplyr')
library(dplyr)
head(starwars)
starwars |> 
  filter(species== "Droid")

only_droids <- starwars |>
  filter(species== "Droid")
  
only_droids

filter <- starwars |>
  filter(skin_color== "light",
         eye_color== "yellow")

filter(starwars, skin_color == "light", 
       eye_color == "brown")

starwars |> 
  arrange(desc(height))

# colums ------------------------------------------------------------------

col <- starwars |> 
  select(hair_color, skin_color, eye_color)
col
except <- starwars |> 
  select(!(name))
except

another <- starwars |>
  select(-height)
another

starwars %>% select(contains('w'))

starwars %>% select(starts_with('e'))


# cambiar el nombre a las columnas ----------------------------------------

starwars |> 
  rename(piel= skin_color)

# dplyr: mutate() ---------------------------------------------------------

new_s <- starwars |>  mutate(mass_new = mass * 1000)

 
 new_s |> 
   select(mass_new, everything())
 
 new_s2 <- starwars |> 
   mutate(mass_new2 = mass /10,
          .keep ="none")
 new_s2
 new_s3 <- starwars |> 
   mutate(mass_new2 = mass /50) |> 
          select(mass_new2)
 
n_s <- starwars |> 
   mutate(new_height= ifelse(height>100,
                            "tall",
                            "small")) |> 
  select(height , new_height, everything())
n_s
library(ggplot2)
starwars |> 
  mutate(height_cat = ifelse(height> 100, 
                             "tall", 
                             "small")) |>  
  ggplot(aes(x=height,
             fill= height_cat )) + 
  geom_histogram() 

# Basic Stats -------------------------------------------------------------
starwars |> 
  summarise(mean_height=
              mean(height, na.rm=T))
n_s |> 
  group_by(new_height) |> 
  summarise(
    mean_height = mean(height, na.rm = TRUE),
    sd_height = sd(height, na.rm = TRUE)
  )
n_s |> 
  group_by(species) |> 
  summarise(
    mean_height = mean(height, na.rm = TRUE),
    sd_height = sd(height, na.rm = TRUE)
  )
n_s |> 
  group_by(new_height, homeworld) |> 
  summarise(
    mean_height = mean(height, na.rm = TRUE)
  )
n_s |> 
  group_by(new_height) |> 
  count(homeworld)

starwars |> sample_n(10) 
