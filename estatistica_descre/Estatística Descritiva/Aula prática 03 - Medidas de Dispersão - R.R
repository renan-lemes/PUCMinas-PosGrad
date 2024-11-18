#Aula prática 03 de Medidas de dispersão

iris
View(iris)
#amostra0
a0=iris$Sepal.Length
length(a0)
sort(a0)

#Amplitude amostral
h0= diff(range(a0))

#Variância amostral
var0=var(a0)
  
#Variância populacional
#var(a0)*(length(a0)-1)/length(a0)

#Desvio padrão amostral
sd0=sd(a0)
sqrt(var0)

mean(a0)-2*sd0
mean(a0)+2*sd0

#Coeficiente de variação amostral
cv0=sd0/mean(a0)*100

#Paramos aqui
#amostra1
a1=iris$Petal.Length
sort(a1)

#Amplitude amostral
h1= diff(range(a1))

#library(dplyr)
#a1 %>% range() %>% diff() 
  
#Variância amostral
var1=var(a1)

#Desvio padrão amostral
sd1=sd(a1)

#Média -2 desvios e +2desvios
mean(a1)-2*sd1
mean(a1)+2*sd1

#Coeficiente de variação amostral
cv1=sd(a1)/mean(a1)*100

dados_a0_consolidados=data.frame("amplitude"=h0,"variancia"=var0,"desvio_padrao"=sd0,"media"=mean(a0),"coeficente_variacao"=cv0)

dados_a1_consolidados=data.frame("amplitude"=h1,"variancia"=var1,"desvio_padrao"=sd1,"media"=mean(a1),"coeficente_variacao"=cv1)

consolidado_comparativo=data.frame(t(dados_a0_consolidados),t(dados_a1_consolidados))

colnames(consolidado_comparativo)=c("resumo_tamanhho_Sepala","resumo_tamanhho_Petala")

consolidado_comparativo

par(mfrow=c(1,2))

# Comparação
plot(a0,ylim =c(1,7),col=iris$Species)
abline(h=mean(a0))
abline(h=mean(a0)-2*sd0)
abline(h=mean(a0)+2*sd0)

plot(a1,col=iris$Species)
abline(h=mean(a1))
abline(h=mean(a1)-1.5*sd1)
abline(h=mean(a1)+1.5*sd1)

#Ótica Tidyverse
library(dplyr)
dados_sepala = iris %>% summarise( media0=mean(Sepal.Length),
                                   h0= diff(range(Sepal.Length)),
                                   var0=var(Sepal.Length),
                                   sd0=sd(Sepal.Length),
                                   cv0=sd0/media0*100
                                   )
         
         
dados_petala = iris %>% summarise( media1=mean(Petal.Length),
                                   h1= diff(range(Sepal.Length)),
                                   var1=var(Petal.Length),
                                   sd1=sd(Petal.Length),
                                   cv1=sd1/media1*100
)

a=c(50,60,70)
b=c(-20,140)

mean(a)
mean(b)

median(a)
median(b)

sd(a)
sd(b)

sd(a)/mean(a)*100

sd(b)/mean(b)*100

     