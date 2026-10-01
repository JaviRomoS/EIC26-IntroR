# Cápsula · Introducción a R

Estrategias de Investigación Cuantitativa 2026 · Facultad de Ciencias Sociales, Universidad de Chile

Cápsula introductoria a R y RStudio para estudiantes de segundo año de Sociología, basada en [*R para Ciencia de Datos*](https://es.r4ds.hadley.nz/) (Wickham y Grolemund). Usa una base de datos **ficticia** con las notas de 98 estudiantes de dos cursos de un colegio.

## Módulos

1. Interfaz de RStudio (consola, script, entorno y proyectos)
2. Programación básica (R como calculadora, objetos, vectores y funciones)
3. Librerías (`install.packages()`, `library()`, `pacman`, `tidyverse`)
4. Bases de datos rectangulares (variable, valor, observación; data frames; importar datos)
5. Naturaleza de las variables (numéricas, texto, lógicas, factores, `haven_labelled`, `NA`)
6. Transformar datos con `dplyr` (`filter`, `arrange`, `select`, `rename`, `mutate`, `group_by` + `summarise`)

## Contenido

| Ruta | Qué es |
|---|---|
| `index.qmd` | Presentación de la cápsula (Quarto revealjs) |
| `estilos.scss`, `img/` | Tema y figuras de la presentación |
| `docs/` | Presentación ya renderizada (la que publica GitHub Pages) |
| `intro_R/` | Proyecto de RStudio para los estudiantes |
| `intro_R.zip` | El mismo proyecto comprimido (se descarga desde la presentación) |


### Base de datos (`notas_colegio.xlsx`)

| Variable | Descripción | Valores |
|---|---|---|
| `id` | Identificador del estudiante | 1 a 98 |
| `curso` | Curso | 2°A, 2°B |
| `genero` | Género | Femenino, Masculino |
| `edad` | Edad en años | 15 a 17 |
| `nota_matematicas` | Promedio anual en Matemáticas | 1,5 a 7,0 · 888 = No rindió · 999 = Sin información |
| `nota_lenguaje` | Promedio anual en Lenguaje | 1,5 a 7,0 · 888 = No rindió · 999 = Sin información |

Los datos son ficticios y fueron simulados con una brecha de género (mejores notas de hombres en Matemáticas y de mujeres en Lenguaje) para fines docentes.
