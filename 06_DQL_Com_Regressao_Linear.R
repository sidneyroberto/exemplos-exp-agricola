# PROMPT para o ChatGPT:
# Poderia por favor preparar os dados da planilha em anexo, os quais se referem 
# a um Delineamento por Quadrado Latino, a fim de que possam ser analisados 
# pela função dql do pacote ExpDes.pt da linguagem R? 

# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Pacote de análises estatísticas
if (!require("ExpDes.pt")) install.packages("ExpDes.pt", repos = "http://cran.rstudio.com/")
library(ExpDes.pt)

# Abre a planilha 1 do arquivo (sheet = 1)
dados <- read_xlsx("dados_dql_quantitativo.xlsx", sheet = 1)

# Faz a ANAVA do DQL com dados mais completos
dql(
  trat=dados$Dose,
  linha=dados$`Matéria Orgânica`,
  coluna=dados$Umidade,
  resp=dados$Valor,
  quali = FALSE,
  mcomp = "tukey",
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)