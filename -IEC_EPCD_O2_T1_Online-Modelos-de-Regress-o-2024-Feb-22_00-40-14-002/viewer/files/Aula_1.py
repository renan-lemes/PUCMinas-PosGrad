# -*- coding: utf-8 -*-
"""
Aula 1 - transformação de variáveis com python
Autora: Anaíle Rabelo
"""

import pandas as pd


dados = pd.read_csv('adult.data.csv')

dados.head()

variaveis_preditoras = dados.iloc[:,0:14]

alvo = dados.iloc[:,14]


##### TRANSFORMAÇÃO DE VARIÁVEIS

from sklearn.preprocessing import LabelEncoder
encoder = LabelEncoder()

alvo = encoder.fit_transform(alvo)


#verificando quantos valores diferentes temos na coluna 
variaveis_preditoras['workclass'].value_counts()
#temos 9 tipos de variaveis diferentes

workclass = encoder.fit_transform(variaveis_preditoras['workclass'])



#Utilizando o python para fazer essa criação do one-hot encoding - Dummy

one_hot = pd.get_dummies(data = variaveis_preditoras, columns= ['workclass'])

#observe que na teoria teriamos n-1 variaveis dummies e o one-hot retorna n variaveis

one_hot_full = pd.get_dummies(data = variaveis_preditoras, columns=['workclass','education','marital-status','occupation','relationship', 'race','gender','native-country'])



# Criando variaveis int. - NÃO É NECESSÁRIO
one_hot = pd.get_dummies(data=variaveis_preditoras, columns=['workclass'], dtype=int)

# Para múltiplas colunas
one_hot_full = pd.get_dummies(data=variaveis_preditoras, 
                              columns=['workclass','education','marital-status','occupation','relationship', 'race','gender','native-country'], 
                              dtype=int)


####ESCALONAMENTO

#vamos jogar os dados em formato de matrix

variaveis_preditoras_2 = one_hot_full

#padronização
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()

variaveis_preditoras_2 = scaler.fit_transform(variaveis_preditoras_2)

#normalização pelo Mininmo e máximo
from sklearn.preprocessing import MinMaxScaler
minmax = MinMaxScaler()

variaveis_preditoras_3 = minmax.fit_transform(variaveis_preditoras_2)
