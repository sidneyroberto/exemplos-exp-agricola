# PROMPT para o ChatGPT:
# Por favor, formate esses dados referentes a um Esquema em Parcela Subdividida 
# de tal forma que eles possam ser analisados pela função psub2.dic do 
# pacote ExpDes.pt. 

# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Pacote de análises estatísticas
if (!require("ExpDes.pt")) install.packages("ExpDes.pt", repos = "http://cran.rstudio.com/")
library(ExpDes.pt)

# Abre a planilha 1 do arquivo (sheet = 1)
dados <- read_xlsx("dados_subdividida2.xlsx", sheet = 1)

psub2.dic(
  fator1=dados$Soja,
  fator2=dados$Dose,
  repet=dados$Repetição,
  resp=dados$Produção,
  quali = c(TRUE, FALSE),
  mcomp = "tukey",
  fac.names = c("Soja", "Dose"),
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)