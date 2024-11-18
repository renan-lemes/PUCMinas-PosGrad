#Aula prática 02 Medidas de tendência central


#Para não aparecer notação científica
options(scipen=999)

#Biblioteca que calcula assimetria e curtose no R
install.packages("e1071")
require(e1071)
#Amostra Empresa A
a = c(2000,3000,4000,9000)
desvio1=2000-4500
desvio2=3000-4500
desvio3=4000-4500
desvio4=9000-4500
soma_desvios_media=sum(desvio1,desvio2,desvio3,desvio4)

#média
media_a = mean(a)

#mediana
mediana_a=median(a)

#install.packages("DescTools")
#Carregando a biblioteca
library(DescTools)
#Calculando a moda
moda_a=Mode(a)
#Amodal

#Medidas resumo:Estatísticas descritivas
summary(a)

#Medidas resumo:Estatísticas descritivas
library(Hmisc)
describe(a)

#Divisão de janelas
par(mfrow=c(1,2))

#Histograma com as frequências simples
hist(a)

#Histograma com as densidades
hist(a,probability = T)

#Curva de densidade
lines(density(a))

#Coeficiente de assimetria de pearson
assimetria_a = skewness(a)

#Coeficiente de curtose de pearson
curtose_a=kurtosis(a)

#histograma da acumulada

#Consolidando as informações
dados_a_consolidados = data.frame("moda"=moda_a,
                                "mediana"=mediana_a,
                                "media"=media_a,
                                "assimetria"=assimetria_a,
                                "curtose"=curtose_a)

#pelo R, temos que se 

#k>0, leptocúrtica
#k=0, Mesocúrtica
#k<0, Platicúrtica

#Amostra Empresa B
b=c(2000,3000,3000,3000,3000,3000,4000,7000,9000)

#média
media_b=mean(b)

#mediana
mediana_b=median(b)

#moda
moda_b=Mode(b)

#Histograma com as frequências simples
hist(b)

#Histograma com as densidades
hist(b,probability = T)

#Curva de densidade
lines(density(b))

#Coeficiente de assimetria de pearson
assimetria_b=skewness(b)

#Coeficiente de curtose de pearson
curtose_b=kurtosis(b)

summary(b)

dados_b_consolidados=data.frame("moda"=moda_b,"mediana"=mediana_b,
                                "media"=media_b,"assimetria"=assimetria_b,
                                "curtose"=curtose_b)

#Amostra Empresa C
c=c(2000,3000,4000,6000, 7000, 7000, 8000,  9000)

#média
media_c=mean(c)

#mediana
mediana_c=median(c)

#moda
moda_c=Mode(c)

#Histograma com as frequências simples
hist(c)

#Histograma com as densidades
hist(c,probability = T)

#Curva de densidade
lines(density(c))

#Coeficiente de assimetria de pearson
assimetria_c=skewness(c)

#Coeficiente de curtose de pearson
curtose_c=kurtosis(c)

summary(c)

dados_c_consolidados=data.frame("moda"=moda_c,"mediana"=mediana_c,"media"=media_c,"assimetria"=assimetria_c,"curtose"=curtose_c)

#ÓTICA TIDYVERSE
install.packages("tidyverse")
library(tidyverse)

library(dplyr)
#Empresa A
a.df=data.frame(a)

a.df_resumo = a.df %>% summarise( 
                               moda_a=Mode(a),
                               mediana_a= median(a),
                               media_a=mean(a),
                               assimetria_a =skewness(a),
                               curtose_a=kurtosis(a)
                               )
                               


b.df=data.frame(b)

#Empresa B
b.df_resumo=b.df%>% summarise(
                              moda_b=Mode(b),
                              mediana_b= median(b),
                              media_b=mean(b),
                              assimetria_b =skewness(b),
                              curtose_b=kurtosis(b)
                              )

c.df=data.frame(c)

#Empresa C
c.df_resumo=c.df %>% summarise( moda_c=Mode(c),
                                mediana_c= median(c),
                                media_c=mean(c), 
                                assimetria_c =skewness(c),
                                curtose_c=kurtosis(c)
                                )


#Concatena linhas
consolidado_empresas=data.frame(a.df_resumo,b.df_resumo,c.df_resumo)

#Transpor para concatenar colunas
consolidado_empresas=data.frame(t(a.df_resumo),t(b.df_resumo),t(c.df_resumo))

#Mudando nomes de linhas e colunas
colnames(consolidado_empresas)=c("resumo_empresa_a","resumo_empresa_b","resumo_empresa_c")
rownames(consolidado_empresas)=c("Moda","Mediana","Media","Assimetria","Curtose")

#amostra especial
mediana_jpmorgan_exemplo=c(16,18,19,20,21,23,28,30,32,33,33,47)

length(mediana_jpmorgan_exemplo)

mean(mediana_jpmorgan_exemplo)

median(mediana_jpmorgan_exemplo)
