rm(list = ls())   # borra todos los objetos del entorno

library(pacman)

pacman::p_load(tidyverse,   # manipulación de datos y gráficos
               readxl)      # abrir archivos de Excel
       

# 1.- Abrir base de datos -------------------------------------------------

notas <- read_excel("input/notas_colegio.xlsx")

# 2. Explorar base de datos -----------------------------------------------

glimpse(notas) # resumen de cada variable

table(notas$genero)

class(notas$nota_matematicas)

mean(notas$nota_lenguaje)

table(notas$nota_lenguaje)


