# PROMPT para o ChatGPT:
# Poderia por favor preparar os dados da planilha em anexo, os quais se referem 
# a um Delineamento por Blocos Casualizados, a fim de que possam ser analisados 
# pela função dbc do pacote ExpDes.pt da linguagem R? 

# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Pacote de análises estatísticas
if (!require("ExpDes.pt")) install.packages("ExpDes.pt", repos = "http://cran.rstudio.com/")
library(ExpDes.pt)

# Abre a planilha 3 do arquivo (sheet = 3)
dados <- read_xlsx("dados_dbc.xlsx", sheet = 3)

# Boxplot dos dados
boxplot(dados$Altura ~ dados$Tratamento)

# Faz a ANAVA dos dados
anova <- aov(dados$Altura ~ dados$Bloco + dados$Tratamento)
summary(anova)

# Pega os erros
erros <- residuals(anova)
erros

# Faz o teste de Shapiro no erros
shapiro.test(erros)

# Faz o boxpolot dos erros
boxplot(erros ~ dados$Tratamento)

# Faz o teste de Bartlett
bartlett.test(erros ~ dados$Tratamento)

# Faz a ANAVA do DBC com dados mais completos
dbc(
  dados$Tratamento,
  dados$Bloco,
  dados$Altura,
  quali = TRUE,
  mcomp = "tukey",
  nl = FALSE,
  hvar = "oneillmathews",
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)
