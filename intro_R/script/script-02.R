rm(list=ls())

library(pacman)
pacman::p_load(tidyverse,   # manipulación de datos y gráficos
               readxl,      # abrir archivos de Excel
               haven)       # variables etiquetadas (SPSS, Stata)

# 1. Cargar datos ---------------------------------------------------------

notas <- read_excel("input/notas_colegio.xlsx")

# 2. Seleccionar variables ------------------------------------------------

notas <- notas %>%
  select(-id) 

# 3. Crear y transformar variables ----------------------------------------

  ## 3.1. renombrar variables ----
notas <- notas %>%
  rename(nota_mate = nota_matematicas,
         nota_leng = nota_lenguaje)

  ## 3.2. recodificar valores perdidos (888 y 999) ----

notas <- notas %>%
  mutate(nota_mate    = if_else(nota_mate %in% c(888, 999), NA, nota_mate), # Mutate usando if_else
         nota_leng    = if_else(nota_leng %in% c(888, 999), NA, nota_leng))

  ## 3.3. Crear nuevas variables ---- 
# Queremos  transformar la variable género a factor, crear promedio de notas del semestre, Una variable que indique si aprueba o no mate

notas <- notas %>%
  mutate(genero       = factor(genero),
         promedio     = (nota_mate + nota_leng) / 2,
         aprueba_mate = if_else(nota_mate >= 4, "Aprueba", "Reprueba"))

# Crear nueva variable: tramo_lenguaje que indique si la nota lenguaje es insuficiente, suficiente o destacado

notas <- notas %>%
  mutate(tramo_lenguaje = case_when(nota_leng  <  4   ~ "Insuficiente",
                                    nota_leng  < 6 ~ "Suficiente",
                                    nota_leng >= 6 ~ "Destacado",
                                    TRUE ~ NA_character_)) # Dependiendo de la naturaleza de la variable nueva

# 4. Filtrar datos  -------------------------------------------------------


# 5. Analisis -------------------------------------------------------------





# 6. Guardamos objetos y base de datos procesada --------------------------


