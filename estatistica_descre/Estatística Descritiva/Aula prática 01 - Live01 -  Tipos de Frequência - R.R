#Aula Prática 01 Tipos de frequência

#Primeira forma de criar o vetor

idade = c(10,
          10,
          10,
          10,
          30,
          30,
          30,
          30,
          30,
          30,
          30,
          30,
          50,
          50,
          50,
          50,
          70,
          70,
          70,
          90)

#Segunda forma de criar o vetor

idade2 = c(rep(10, 4), rep(30, 8), rep(50, 4), rep(70, 3), 90)

#Achando as Frequências simples (fi)

frequencia_simples = table(idade)

#Visual excel

dados_simples = data.frame(frequencia_simples)

#ver o banco todo (Não recomendável para bancos gigantescos)
View(dados_simples)

#Ver as n primeiras linhas do data.frame
head(dados_simples, 2)

#Frequência acumulada

frequencia_acumulada = cumsum(frequencia_simples)


#Adicionando coluna com acumulada

dados_simples$frequencia_acumulada = frequencia_acumulada

#Frequência relativa simples

frequencia_relativa_simples = frequencia_simples / sum(frequencia_simples)

#segunda forma para obter frequencias relativa simples utilizando a função prop.table()
prop.table(frequencia_simples)

#Adicionando a Frequência relativa simples

dados_simples$frequencia_relativa_simples = frequencia_relativa_simples

#Frequência relativa acumulada

frequencia_relativa_acumulada = frequencia_acumulada / sum(frequencia_simples)

#Frequência relativa acumulada(Segunda forma)
#sugestão marcos
frequencia_relativa_acumulada = cumsum(frequencia_relativa_simples)


#Criando a variavel frequencia_relativa_acumulada

dados_simples$frequencia_relativa_acumulada = frequencia_relativa_acumulada

#Renomeando uma coluna do dataframe dados_simples

names(dados_simples)[5] = "frequencia_relativa_acumulada"

name

#Achando automaticamente a frequência simples e relativa simples
install.packages("Hmisc")
require(Hmisc)
describe(idade)

#Ótica tydiverse
install.packages("dplyr")
require(dplyr)

#Atalho do pipe Ctrl+shift+m

#base #FOG
#f(g(x))
funcao3(funcao2(funcao1(head(dados_simples))))
#tidyverse #GOF
#g(f(x))
dados_simples %>% head() %>% 
                  funcao1() %>% 
                  funcao2() %>% 
                  funcao3()

dados_simples_tidy = dados_simples %>%
  mutate(
    frequencia_acumulada = cumsum(Freq),
    frequencia_relativa_simples = Freq / sum(Freq),
    frequencia_relativa_acumulada = cumsum(frequencia_relativa_simples)
  )

#Ordenando de forma decrescente pela idade utilizando a função arrange()
dados_simples_tidy_ordenado = dados_simples_tidy %>% arrange(desc(Freq))

#Exportando como banco de dados csv
write.csv2(dados_simples_tidy, "coco1.csv", row.names = F)
