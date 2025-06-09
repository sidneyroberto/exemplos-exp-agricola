# PROMPT para o ChatGPT:
# Por favor, formate esses dados referentes a um Esquema Fatorial de tal forma
# que eles possam ser analisados pela função fat2.dbc do pacote ExpDes.pt. Crie 
# também uma coluna "Tratamento", cujos dados devem conter as combinações dos 
# nomes dos 2 fatores.

# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Pacote de análises estatísticas
if (!require("ExpDes.pt")) install.packages("ExpDes.pt", repos = "http://cran.rstudio.com/")
library(ExpDes.pt)

# Abre a planilha 1 do arquivo (sheet = 1)
dados <- read_xlsx("dados_fatorial2.xlsx", sheet = 1)

fat2.dbc(
  fator1=dados$Fungo,
  fator2=dados$Substrato,
  bloco=dados$Bloco,
  resp=dados$Altura,
  quali = c(TRUE, TRUE),
  mcomp = "tukey",
  fac.names = c("Fungo", "Substrato"),
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)