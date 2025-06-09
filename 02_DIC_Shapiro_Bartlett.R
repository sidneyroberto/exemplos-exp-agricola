# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Pacote de análises estatísticas
if (!require("ExpDes.pt")) install.packages("ExpDes.pt", repos = "http://cran.rstudio.com/")
library(ExpDes.pt)

# Abre a planilha 1 do arquivo (sheet = 1)
dados <- read_xlsx("dados_dic.xlsx", sheet = 1)

# 1º -> Fazer a ANAVA
# 2º -> Extrair os erros
# 3º -> Testes (normalidade e homogeneidade de variância)

# Fazendo a ANAVA
anava = aov(dados$`Massa 100 grãos (g)` ~ dados$Fungicida)
summary(ANAVA)

# Extraindo os erros (desvios)
desvios = residuals(anava)
summary(desvios)

# Teste de normalidade de Shapiro Wilks
# Ho -> Normal (p-value >= 0,05)
# H1 -> Não normal (p-value < 0,05)
shapiro.test(desvios)

# Homocedasticidade (ou Homogeneidade de Variância)
# Ho -> homocedástico (p-value >= 0.05)
#   Não há evidência estatística de que as variâncias sejam diferentes.
#   ➜ As variâncias podem ser consideradas homogêneas.
# H1 -> Heterocedástico (p-value < 0,05)
#   Há evidência de que pelo menos uma variância é diferente.
#   As variâncias são heterogêneas (violam o pressuposto de homogeneidade).
bartlett.test(desvios~dados$Fungicida)

# Faz a ANAVA do DIC com dados mais completos
dic(
  dados$Fungicida, # tratamento
  dados$`Massa 100 grãos (g)`, # resposta
  quali = TRUE, # o tratamento é qualitativo
  mcomp = "tukey", 
  nl = FALSE,
  hvar = "bartlett",
  sigT = 0.05,
  sigF = 0.05,
  unfold = NULL
)

