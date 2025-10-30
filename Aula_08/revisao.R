install.packages('openxlsx')
install.packages('FSA')

# Bibliotecas
library(FSA) #Utilizado para análise descritiva dos dados (Summarize)
library(plotly)
library(dplyr)
library(readxl)
library(openxlsx)

file.choose()
rota_planilha <- "C:\\Users\\fabio\\OneDrive\\Área de Trabalho\\Curso estatística - Linguagem R\\Aula 08\\planilha_satisfacao.xlsx"

#Definição de qual planilha (aba) vai se trabalhar
dados <- read_excel(rota_planilha) 
head(dados)

# ------------------------------Exercício 01--------------------------------

# ----------------------------------1.a-------------------------------------
# Mostra a estrutura do data frame, incluindo o tipo de cada variável.
str(dados)
glimpse(dados)

# Uma alternativa usando a biblioteca dplyr (parte do tidyverse)
# install.packages('dplyr')
# library(dplyr)
# glimpse(dados)

# ----------------------------------1.b-------------------------------------

# O código utiliza um loop for para iterar sobre as variáveis quantitativas 
# e aplica a função Summarize da biblioteca FSA. É calculada as principais 
# estatísticas descritivas 
# (n, média, desvio padrão, mínimo, quartis e máximo) para cada variável. 

quantitativas <- c('idade', 'renda', 'satisfacao_curso')

# Inicia um loop for. Este loop irá executar o bloco de código 
# dentro das chaves {} repetidamente, uma vez para cada item no 
# vetor quantitativas.

# Na primeira iteração, a variável i receberá o valor "idade".
# Na segunda iteração, i receberá o valor "renda".
# Na terceira iteração, i receberá o valor "satisfacao_curso".

# Summarize(...): Gera um resumo estatístico detalhado.

# dados[[i]]: É a forma de selecionar uma coluna de um data 
# frame (dados) usando o nome da coluna que está armazenado em uma 
# variável (i). Por exemplo, na primeira iteração, dados[["idade"]] 
# é o mesmo que dados$idade. Isso permite que o loop analise uma 
# coluna diferente a cada passagem.

for (i in quantitativas) {
  resultado_summarize <- Summarize(dados[[i]], na.rm =TRUE)
  cat("Resumo da variável", i, ":\n")
  print(round(resultado_summarize, 4))
  cat("\n")
}

# Complementação: Uma alternativa comum na linguagem R base 
# seria a função summary(), que oferece um resumo semelhante.
summary(dados[quantitativas])


# ----------------------------------1.c-------------------------------------

# O código calcula corretamente a tabela de frequência com table() e 
# depois a converte em proporções com prop.table(). 

qualitativas <- c('sexo', 'educacao')

# Inicia um loop for. Este loop irá executar o bloco de código dentro 
# das chaves {} repetidamente, uma vez para cada item no vetor 
# qualitativas.

# Na primeira iteração, a variável i terá o valor "sexo".
# Na segunda iteração, i terá o valor "educacao".

# dados[[i]]: Primeiro, ele seleciona a coluna do data frame dados 
# cujo nome está atualmente na variável i. Na primeira iteração, isso 
# é o mesmo que dados$sexo.

# table(...): A função table() é aplicada a essa coluna. 
# Ela cria uma tabela de frequência absoluta, ou seja, conta quantas 
# vezes cada categoria única aparece.

# prop.table(...): Por fim, a função prop.table() 
# (tabela de proporções) pega o resultado da table() e converte as 
# contagens brutas em proporções (frequências relativas), onde o 
# total soma 1.0.
for (i in qualitativas) {
  resultado_qualitativo <-  prop.table(table(dados[[i]]))
  cat("Resumo da variável", i, ":\n")
  print(round(resultado_qualitativo,4))
  cat("\n")
}

# ----------------------------------1.d-------------------------------------

# A faixa etária dominante é aquela representada pela barra mais alta 
# no histograma.

plot_ly(dados, x =~idade, type = 'histogram')

# ------------------------------Exercício 02--------------------------------

# ----------------------------------2.a-------------------------------------

# nrow(dados): Calcula o número total de linhas no seu 
# data frame dados.

# sample(nrow(dados), 120): É a função que faz a amostragem. 
# Ela está dizendo ao R: "Pegue uma sequência de números de 1 até 
# o número total de linhas de dados e selecione aleatoriamente 
# 120 números dessa sequência".

# replace = FALSE: Ele especifica que a amostragem é feita 
# sem reposição. Isso significa que, uma vez que o número de 
# uma linha é selecionado, ele não pode ser selecionado novamente.

# dados[...]: A parte dados[] é a forma de selecionar 
# linhas e colunas de um data frame. O que está antes da 
# vírgula refere-se às linhas, e o que está depois refere-se 
# às colunas.

set.seed(42)
amostra <- dados[sample(nrow(dados), 120),replace= FALSE]
amostra

# Salvar em Excel
write.xlsx(amostra, file = "amostra.xlsx")

# ----------------------------------2.b-------------------------------------

# amostra$idade (Variável à Esquerda): Esta é a variável de 
# interesse, a que você quer analisar. É a variável dependente 
# ou de resposta. Neste caso, é a idade.

# ~ (O Operador de Fórmula): Diz "agrupe a análise da 
# variável à esquerda de acordo com as categorias da variável 
# à direita".

# amostra$sexo (Variável à Direita): Esta é a variável de 
# agrupamento. É a variável independente ou preditora. 
# Neste caso, é o sexo.

Summarize(amostra$idade~amostra$sexo)

# ----------------------------------2.c-------------------------------------

# Assim como no item anterior, o código calcula as estatísticas descritivas 
# da renda, agrupando por sexo

Summarize(amostra$renda~amostra$sexo)

# ----------------------------------2.d-------------------------------------

# Em outras palavras, ele não calcula o percentual de homens e 
# mulheres no total da amostra, mas sim o percentual de homens 
# e mulheres dentro de cada grupo educacional.

# A primeira variável (amostra$sexo) se torna as linhas da 
# tabela, e a segunda variável (amostra$educacao) se torna as 
# colunas

# A função table() produz uma tabela de contagens

# prop.table(..., 2): Esta função pega a tabela de contagens 
# criada no passo anterior e a converte em uma tabela de 
# proporções (frequências relativas)

# Ao especificar 2, você está instruindo a função prop.table() 
# a calcular as proporções ao longo das colunas. Isso significa 
# que a soma de cada coluna individualmente será igual a 1 
# (ou 100%).

prop.table(table(amostra$sexo, amostra$educacao), 2)



# ------------------------------Exercício 03--------------------------------

# ----------------------------------3.a-------------------------------------

# O código gera um histograma, que é uma das melhores opções para visualizar 
# a distribuição de uma variável quantitativa contínua como a renda.

plot_ly(amostra, x = ~renda, type = 'histogram')

# ----------------------------------3.b-------------------------------------

# O código calcula um resumo estatístico completo, que contém todas as 
# medidas necessárias.

Summarize(amostra$renda)

# ----------------------------------3.c-------------------------------------

# Ao analisar o box plot que relaciona idade e educação, podemos comparar 
# a distribuição da idade entre os diferentes níveis educacionais.

# boxpoints = "all": instrui a função a exibir todos os 
# pontos de dados individuais que compõem cada boxplot.

plot_ly(amostra, x=~educacao, y=~idade, type = 'box',
        boxpoints = "all")

# ----------------------------------3.d-------------------------------------

# Um gráfico de dispersão (scatter plot) é a escolha padrão e correta para 
# visualizar a relação entre duas variáveis quantitativas.

plot_ly(amostra, x=~idade, y=~renda, type='scatter', 
        mode ='markers')

# ------------------------------Exercício 04--------------------------------

# ----------------------------------4.a-------------------------------------

# 

plot_ly(amostra,x = ~sexo, y = ~satisfacao_curso , 
        type = 'box')

# Para obter os valores exatos da média e mediana
Summarize(amostra$satisfacao_curso ~ amostra$sexo)

# ----------------------------------4.c-------------------------------------

# nrow(): conta o número total de linhas (observações) no 
# data frame amostra

# probabilidade <- maior_7 / total
# A linha acima executa a fórmula abaixo:
# P(evento) = Nº de casos favoráveis / Nº total de casos possíveis

total <- nrow(amostra)
maior_7 <- sum(amostra$satisfacao_curso >7)
probabilidade <- maior_7/total
probabilidade* 100

# ----------------------------------4.d-------------------------------------

# O código calcula a probabilidade condicional: a probabilidade de um aluno 
# ter satisfação > 7, dado que ele é do sexo masculino. O cálculo está 
# correto para essa interpretação. O numerador sm7 conta os homens com 
# satisfação > 7, e o denominador total_masculino restringe o universo de 
# análise apenas aos homens.

total_masculino <- sum(amostra$sexo == "Masculino")
sm7 <- sum(amostra$satisfacao_curso > 7 & amostra$sexo == "Masculino")
probabilidade_masculina <- sm7 / total_masculino
probabilidade_masculina * 100