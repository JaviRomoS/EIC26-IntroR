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

   ## 3.1. Renombrar ----

notas <- notas %>%
  rename(nota_mate = nota_matematicas,
         nota_leng = nota_lenguaje)

   ## 3.2. Recodificar perdidos ----

notas <- notas %>%
  mutate(nota_mate    = if_else(nota_mate %in% c(888, 999), NA, nota_mate),
         nota_leng    = if_else(nota_leng %in% c(888, 999), NA, nota_leng))

   ## 3.3. Crear variables (promedio, aprueba mate) y pasar genero a factor----

notas <- notas %>%
  mutate(genero       = factor(genero),
         promedio     = (nota_mate + nota_leng) / 2,
         aprueba_mate = if_else(nota_mate >= 4, "Aprueba", "Reprueba")) 


   ## 3.4. Crear ordinal para nota lenguaje (tramo_lenguaje) ----

notas <- notas %>%
  mutate(tramo_lenguaje = case_when(nota_leng  <  4   ~ "Insuficiente",
                                    nota_leng  < 6 ~ "Suficiente",
                                    nota_leng >= 6 ~ "Destacado",
                                    TRUE ~ NA_character_)) # Dependiendo de la naturaleza de la variable nueva
# 4. Filtrar casos --------------------------------------------------------
# (no lo vamos a hacer en este práctico)

# 5. Analisis -------------------------------------------------------------

# Pregunta: ¿Cuál es la brecha de género en cada asignatura? ¿Es igual en ambos cursos?

# Brecha de género: nota mujeres - nota de los hombres

# < 0 → Brecha negativa (mujeres tenian peor nota)
# = 0 → No hay brecha (hombres y mujeres tienen igual nota)
# > 0 → Brecha es positiva (mujeres tenian mejor nota)

brechas <- notas %>%
  group_by(curso, genero) %>%                                    # 1. promedios por curso y género
  summarise(mate = mean(nota_mate, na.rm = TRUE),
            leng = mean(nota_leng, na.rm = TRUE),
            .groups = "drop") %>%
  
  pivot_wider(names_from = genero, values_from = c(mate, leng)) %>%  # 2. una columna por género
  
  mutate(brecha_mate = round(mate_Femenino - mate_Masculino, 2),   # 3. mujeres - hombres
         brecha_leng = round(leng_Femenino - leng_Masculino, 2))

# 6. Guardar tablas y bases datos -----------------------------------------

write_csv(brechas, "output/brechas_genero.csv")   # tabla de resultados

saveRDS(notas, "output/notas_limpia.rds")         # base limpia, para seguir trabajando
