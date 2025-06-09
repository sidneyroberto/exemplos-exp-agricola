# Cria uma coleção de dados

pesos = c(31.2, 32.7, 33.5, 34.1, 34.1, 35.6, 36.8, 37.4, 38.0, 38.9,  
          39.7, 40.2, 40.8, 41.5, 42.3, 43.0, 43.6, 44.5, 45.1, 45.9,  
          46.4, 47.0, 47.6, 48.3, 48.9, 49.5, 50.0, 30.7, 5, 120
)

# Medidas de posição

media = mean(pesos) # média
media
mediana = median(pesos) # mediana
mediana

# Importa a biblioteca necessária para pegar a moda do conjunto
if (!require("modeest")) install.packages("modeest", repos = "http://cran.rstudio.com/")
library(modeest)
moda = mfv(pesos) # moda
moda

# Medidas de dispersão
variancia = var(pesos) # variância
variancia
desvio_padrao = sd(pesos) # desvio padrão
desvio_padrao

coeficiente_de_variacao = (desvio_padrao / media) * 100 # coeficiente de variação
cat("\nCoeficiente de variação:", coeficiente_de_variacao)


# Boxplot
boxplot(pesos)

# Histograma
hist(pesos)

outliers = boxplot.stats(pesos)$out # pega os outliers
outliers