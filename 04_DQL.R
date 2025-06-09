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
dados <- read_xlsx("dados_dql.xlsx", sheet = 1)

# Boxplot
boxplot(dados$Producao ~ dados$Bioestimulante)

# Faz a ANAVA dos dados
anova = aov(dados$Producao ~ dados$Umidade+dados$Argila+dados$Bioestimulante)
summary(anova)

# Pega os erros
erros = residuals(anova)
erros

# Histograma dos erros
hist(erros)

# Teste de Shapiro Wilk nos erros
shapiro.test(erros)

# Teste de Bartlett
bartlett.test(erros ~ dados$Bioestimulante)

# Faz a ANAVA do DQL com dados mais completos
dql(
  trat=dados$Bioestimulante,
  linha=dados$Umidade,
  coluna=dados$Argila,
  resp=dados$Producao,
  quali = TRUE,
  mcomp = "tukey",
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)

