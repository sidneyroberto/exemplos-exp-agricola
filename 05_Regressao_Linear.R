# PROMPT para o ChatGPT:
# Poderia por favor preparar os dados da planilha em anexo, os quais se referem 
# a uma análise de regressão linear, a fim de que possam ser analisados 
# pela função lm da linguagem R? 

# Pacote para ler o arquivo do Excel, caso não queira fazer a importação do jeito
# que foi mostrado na aula
if (!require("readxl")) install.packages("readxl", repos = "http://cran.rstudio.com/")
library(readxl)

# Abre a planilha 1 do arquivo (sheet = 1)
dados <- read_xlsx("regressao_simples.xlsx", sheet = 1)

# Calcula a correlação entre as variáveis
cor(dados$`Teor de Argila`, dados$Produtividade)

# Exibe o gráfico, onde o primeiro argumento é o eixo x e o segundo o eixo y
plot(dados$`Teor de Argila`, dados$Produtividade)

# Realiza a análise de regressão linear
regressao = lm(dados$Produtividade ~ dados$`Teor de Argila`)
summary(regressao)

# LEMBRETE: o somatório dos erros deve ser igual ou próximo a 0
erros = regressao$residuals
sum(erros)
sd(erros)

# Testando a normalidade dos dados
shapiro.test(erros)

if (!require("lmtest")) install.packages("lmtest", repos = "http://cran.rstudio.com/")
library(lmtest)

# Se p-value > 0.05, logo os meus resíduos são homocedásticos ao longo do eixo X
gqtest(erros ~ dados$Produtividade)