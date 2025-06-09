# PROMPT para o ChatGPT:
# Por favor, formate esses dados referentes a um Esquema em Parcela Subdividida 
# de tal forma que eles possam ser analisados pela função psub2.dbc do 
# pacote ExpDes.pt. 

# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Pacote de análises estatísticas
if (!require("ExpDes.pt")) install.packages("ExpDes.pt", repos = "http://cran.rstudio.com/")
library(ExpDes.pt)

# Abre a planilha 1 do arquivo (sheet = 1)
dados <- read_xlsx("dados_subdividida1.xlsx", sheet = 1)

psub2.dbc(
  fator1=dados$Manejo,
  fator2=dados$Soja,
  bloco=dados$Bloco,
  resp=dados$Produção,
  quali = c(TRUE, TRUE),
  mcomp = "tukey",
  fac.names = c("Manejo", "Soja"),
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)