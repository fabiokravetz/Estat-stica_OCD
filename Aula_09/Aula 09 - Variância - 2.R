# Pacote stats contém a grande maioria das 
# funções estatísticas básicas do R, incluindo rnorm e 
# bartlett.test.
install.packages('stats')
library(stats)

# Dados normais
set.seed(123)  # Para tornar os resultados reproduzíveis

# Criar os grupos de dados

# rnorm(): Gera números aleatórios que seguem uma distribuição 
# normal.

# Conceito-chave: Como a variância é o desvio padrão ao 
# quadrado, foi criado dois grupos com a mesma variância teórica. 
# O propósito do script é ver se o Teste de Bartlett consegue detectar 
# essa igualdade que foi forçada.

grupo1 <- rnorm(50, mean = 0, sd = 1)
grupo2 <- rnorm(50, mean = 0, sd = 1)

print(grupo1)
print(grupo2)

# Criar um vetor de grupos para identificar a que grupo cada 
# observação pertence

# rep(): Função para repetir elementos.

# c("Grupo 1", "Grupo 2"), each = 50: Cria um vetor de 
# 100 elementos, onde os primeiros 50 são a string "Grupo 1" 
# e os 50 seguintes são a string "Grupo 2". 

grupos <- rep(c("Grupo 1", "Grupo 2"), each = 50)
print(grupos)

# data.frame(...): Cria uma tabela (dataframe) chamada dados.

# Grupo = grupos: Cria uma coluna chamada Grupo com os 
# identificadores "Grupo 1" e "Grupo 2".

# c(grupo1, grupo2): Empilha os 50 valores do grupo2 abaixo 
# dos 50 valores do grupo1, criando um único vetor de 100 
# valores.

# Valor = c(grupo1, grupo2): Cria uma coluna chamada Valor 
# com os 100 números aleatórios.
dados <- data.frame(Grupo = grupos, Valor = c(grupo1, grupo2))
print(dados)

# Se as "caixas" tiverem alturas (dispersões) semelhantes, 
# isso sugere visualmente que as variâncias são homogêneas.

windows()
boxplot(grupo1,grupo2) # Cria um boxplot lado a lado. 

#--------------Teste de Bartlett - Verificação estatística----------


# Valor ~ Grupo: Diz "Analise a variabilidade da coluna Valor 
# em função dos níveis da coluna Grupo.

# data = dados: Especifica que as colunas Valor e Grupo estão 
# dentro do dataframe dados

# 1. As Hipóteses do Teste O Teste de Bartlett, assim como o 
# Shapiro-Wilk, é um teste de pressuposto. Suas hipóteses são:

# Hipótese Nula: As variâncias são iguais em todos os grupos.

# Hipótese Alternativa: Pelo menos um grupo tem uma variância 
# diferente dos demais.

bartlett.test(Valor ~ Grupo, data = dados)

# K-squared é o valor que resume o quão diferentes as variâncias 
# são entre si.

# Um valor de K-squared próximo de zero indica que as 
# variâncias dos seus grupos são muito parecidas

# Um K-squared próximo de zero é um indicativo de que as 
# variâncias são iguais, 

# p-value é o resultado principal para a tomada de decisão.

# Se p-valor < 0.05: Rejeitamos a H₀.
# Se p-valor > 0.05: Não rejeitamos a H₀.


#--------------------------------------------------------------


# Criar um grupo com variância não homogênea
grupo_nao_homogeneo1 <- rnorm(25, mean = 5, sd = 2)
grupo_nao_homogeneo2 <- rnorm(25, mean = 5, sd = 4)

# Criar um vetor de grupos para identificar a que grupo cada observação pertence
grupos <- rep(c("grupo_nao_homogeneo1", "grupo_nao_homogeneo2"), each = 25)

# Criar um dataframe com os dados e grupos
dados <- data.frame(Grupo = grupos, Valor = c(grupo_nao_homogeneo1, grupo_nao_homogeneo2))

# Boxplot
windows()
boxplot(grupo_nao_homogeneo1,grupo_nao_homogeneo2)

# Realizar o teste de Bartlett
bartlett.test(Valor ~ Grupo, data = dados)
