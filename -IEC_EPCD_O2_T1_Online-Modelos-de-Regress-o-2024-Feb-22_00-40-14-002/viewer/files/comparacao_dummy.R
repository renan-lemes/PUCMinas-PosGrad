library(tidyverse)

library(readxl)
dados_cpi <- read_excel("C:/Users/anail/OneDrive/Desktop/Aula_1/comparacao_dummy/comparacao_dummy.xlsx")
View(comparacao_dummy)

#pais 
#regiao do globo que se encontra cada pais
#CPI - de 0 a 100 quanto maior a nota melhor a percepção do inficador de currupção para cada pais 

dados_cpi 

regiao <- dados_cpi$Region
freq_regiao <- table(regiao)

freq_regiao

library(ggplot2)

ggplot(data = dados_cpi, aes(x=Region,fill=Region))+ geom_bar()+geom_text(aes(label=..count..),stat="count")+
  ggtitle('Quantidade de países por região')

dados_cpi <- dados_cpi %>%
  mutate(cod_regiao = forcats::fct_recode(Region,
                                                             "1" = "AME",
                                                             "2" = "AP",
                                                             "3" = "ECA",
                                                             "4" = "MENA",
                                                             "3" = "SSA",
                                                             "4" = "WE/EU"))%>%
  mutate(cod_regiao = as.numeric(cod_regiao))
dados_cpi
#quremos avaliar se existe difereça média de países vindos de diferentes regiões

#muitas pessoas fazem simplesmente assim:

modelo1 <- glm(data = dados_cpi, formula = CPI_score ~ Region) 

modelo2 <- glm(data = dados_cpi, formula = CPI_score ~ cod_regiao)



modelo1
modelo2

#O modelo 2 nao faz menor sentido, uma vez que atribuimos valores arbitrarios as regioes 

ggplot(dados_cpi, aes(x = cod_regiao, y = CPI_score)) +
  geom_point() +  # Adiciona os pontos do gráfico de dispersão
  geom_smooth(method = lm, se = FALSE) +  # Adiciona a reta ajustada sem intervalo de confiança
  labs(x = "Código da Região", y = "CPI Score") +  # Adiciona rótulos aos eixos
  ggtitle("Gráfico de Dispersão com Reta Ajustada")  # Adiciona título ao gráfico


ggplot(data = dados_cpi, aes(x = cod_regiao, y = CPI_score)) +
  geom_point() +  # Adiciona os pontos do gráfico de dispersão
  geom_smooth(method = "lm", se = FALSE) +  # Adiciona a reta ajustada sem intervalo de confiança
  labs(x = "Código da Região", y = "CPI Score") +  # Adiciona rótulos aos eixos
  ggtitle("Gráfico de Dispersão com Reta Ajustada")  # Adiciona título ao gráfico


ggplot(data = dados_cpi, aes(x = Region, y = CPI_score)) +
  geom_point(dados_cpi$predito) +  # Adiciona os pontos dos valores preditos
  geom_smooth(method = "glm", formula = y ~ x, se = FALSE) +  # Adiciona a curva resultante do modelo
  labs(x = "Região", y = "Valores Preditos (CPI Score)") +  # Adiciona rótulos aos eixos
  ggtitle("Valores Preditos e Curva Resultante do Modelo")  # Adiciona título ao gráfico

ggplot(data = dados_cpi, aes(x = Region, y = CPI_score)) +
  geom_point() +  # Adiciona os pontos reais
  geom_point(aes(y = predito), color = "red") +  # Adiciona os pontos dos valores preditos
  geom_smooth(data = dados_cpi, aes(x = Region, y = predito), method = "glm", formula = y ~ x, se = FALSE) +  # Adiciona a curva resultante do modelo usando os valores preditos
  labs(x = "Região", y = "CPI Score") +  # Adiciona rótulos aos eixos
  ggtitle("Valores Preditos e Curva Resultante do Modelo")  # Adiciona título ao gráfico


ggplot(data = dados_cpi, aes(x = Region, y = CPI_score)) +
  geom_point() +  # Adiciona os pontos reais
  geom_point(aes(y = predito), color = "red") +  # Adiciona os pontos dos valores preditos
  geom_line(data = dados_cpi$predito) +  # Adiciona a curva resultante do modelo usando os valores preditos
  labs(x = "Região", y = "CPI Score") +  # Adiciona rótulos aos eixos
  ggtitle("Valores Preditos e Curva Resultante do Modelo")  # Adiciona título ao gráfico

dados_cpi <- mutate(dados_cpi, predito = predict(modelo2))

ggplot(data = dados_cpi, aes(x = Region, y = CPI_score)) +
  geom_point() +  # Adiciona os pontos reais
  geom_point(aes(y = predito), color = "red") +  # Adiciona os pontos dos valores preditos
  geom_smooth(data = dados_cpi, aes(x = Region, y = predito), method = "glm", formula = y ~ x, se = FALSE) +  # Adiciona a curva resultante do modelo usando os valores preditos
  labs(x = "Região", y = "CPI Score") +  # Adiciona rótulos aos eixos
  ggtitle("Valores Preditos e Curva Resultante do Modelo")  # Adiciona título ao gráfico

ggplot(data = dados_cpi, aes(x = Region, y = CPI_score)) +
  geom_point() +  # Adiciona os pontos reais
  geom_line(data = dados_cpi, aes(y = predito), color = "red") +  # Adiciona a linha dos valores preditos
  labs(x = "Região", y = "CPI Score") +  # Adiciona rótulos aos eixos
  ggtitle("Valores Preditos e Curva Resultante do Modelo")  # Adiciona título ao gráfico

library(ggplot2) 
dados_cpi%>%
 ggplot(mapping = aes(Region, CPI_score)) +
  geom_point() +
  geom_smooth(method = "lm")
dados_cpi%>%
plot(CPI_score~Region)
curve(modelo1$coefficients[1]+modelo1$coefficients[2]*x, add=T,col="blue")


dados_cpi%>%
ggplot() +
  geom_point(aes(x = Region, y = CPI_score), color = "blue") +  # Adiciona os pontos dos dados originais
  geom_line("lm") +  # Adiciona a curva resultante da regressão
  labs(x = "X", y = "Y") +  # Adiciona rótulos aos eixos
  ggtitle("Curva Resultante de uma Regressão Linear")  # Adiciona título ao gráfico

ggplot(data = dados_cpi, aes(x = Region, y = CPI_score)) +
  geom_point(color = "blue") +  # Adiciona os pontos dos dados originais
  geom_smooth(data = dados_cpi, aes(x = Region, y = predito), method = "glm", formula = 'predito ~ Region', color = "red", se = FALSE) +  # Adiciona a curva suave resultante da regressão
  labs(x = "X", y = "Y") +  # Adiciona rótulos aos eixos
  ggtitle("Curva Resultante de uma Regressão Linear")  # Adiciona título ao gráfico
