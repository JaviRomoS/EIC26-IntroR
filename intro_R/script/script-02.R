rm(list=ls())

library(pacman)
pacman::p_load(tidyverse,   # manipulación de datos y gráficos
               readxl,      # abrir archivos de Excel
               haven)       # variables etiquetadas (SPSS, Stata)

notas <- read_excel("input/notas_colegio.xlsx")
notas

# 1. Exploracion base de datos --------------------------------------------

glimpse(notas) # resumen de cada variable

class(notas$genero)

mean(notas$nota_matematicas)

notas %>%
  filter(curso == "2°A")

notas %>%
  filter(curso == "2°B" &
           genero == "Femenino")

notas %>%
  filter(edad == 15 | edad == 17)

notas %>%
  filter(nota_matematicas %in% c(888, 999)) %>%
  select(id, curso, nota_matematicas)

# 2. Crear y transformar variables ----------------------------------------

#notas <-
  notas %>% 

  select(-id) %>%  
  
  mutate(nota_matematicas = if_else(nota_matematicas > 7, NA, nota_matematicas),
         nota_lenguaje    = if_else(nota_lenguaje %in% c(888, 999), NA, nota_lenguaje))


notas <- notas %>%
  mutate(tramo_lenguaje = case_when(nota_lenguaje <  4   ~ "Insuficiente",
                                    nota_lenguaje < 6 ~ "Suficiente",
                                    nota_lenguaje >= 6 ~ "Destacado",
                                    TRUE ~ NA_character_))
