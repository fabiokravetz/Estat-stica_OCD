#-------------------------Aula - Técnicas de Amostragem-------------------------
# 1) Simule o lançamento de uma moeda 10 vezes e conte 
#quantas vezes saiu “cara”.

#sample(...): Função utilizada para realizar uma amostragem
#aleatória

#size = 10: Define o tamanho da amostra, ou seja, quantas
#vezes queremos "sortear" um item do conjunto

#replace = TRUE: Significa que uma amostragem é realizada
#com reposição

#set.seed(...): 

set.seed(789)
lancamentos <- sample(c("cara", "coroa"), size = 10, replace = TRUE)
num_caras <- sum(lancamentos == "cara")
print(paste("O número de caras é igual a ", num_caras))

#-------------------------------Questão 02--------------------------------
#Calcule a probabilidade de tirar um número maior que 4 ao lançar um dado.
casos_possiveis <- 6
casos_favoraveis <- 2

result_prob <- casos_favoraveis / casos_possiveis

print(paste("A probabilidade de tirar um número maior que 4 é ", 
            round(result_prob, 2) * 100, "%"))

#-------------------------------Questão 03--------------------------------
#Simule 50 lançamentos de um dado e calcule a frequência relativa 
#de cada número.

#1:6 é o equivalente a c(1, 2, 3, 4, 5, 6)

set.seed(111)
resultados <- sample(1:6, size = 50, replace = TRUE)
tabela_frequencias <- table(resultados)

#print(tabela_frequencias)

resultados_frequencias <- tabela_frequencias / length(resultados)
print(resultados_frequencias)
print(length(resultados))

#-------------------------------Questão 04--------------------------------
#Se sabemos que um número maior que 3 foi lançado em um dado, qual a 
#probabilidade de ser um número par?

# Definindo os eventos
maior_3 <- 3 # 4,5,6
numeros_pares <- 2 # 4, 6

# Calculando a probabilidade condicional diretamente
probabilidade_condicional <- numeros_pares / maior_3

# Imprimindo o resultado
print(paste("A probabilidade de o número ser par, dado que 
    é maior que 3, é:", round(probabilidade_condicional,2)))

#-------------------------------Questão 05--------------------------------
#Probabilidade de tirar um número par em um dado.

probabilidade_par <- 3/6 # (2, 4, 6) / 6 resultados possíveis
print(paste("A probabilidade é igual a: ", probabilidade_par))

#-------------------------------Questão 06--------------------------------

#Se você jogar uma moeda duas vezes, qual a probabilidade de sair 
#cara nas duas vezes?

#---Probabilidade de sair "cara" em um único lançamento---

#Em um único lançamento de uma moeda não viciada, há dois resultados 
#possíveis: cara ou coroa. A probabilidade de sair "cara" é de 
#1 em 2, ou 1/2.

prob_cara <- 1 / 2

#---Probabilidade de sair "cara" em ambos os lançamentos---

#Como o resultado do primeiro lançamento não afeta o segundo, 
#os eventos são independentes. Para encontrar a probabilidade 
#de dois eventos independentes ocorrerem em sequência, 
#multiplicamos suas probabilidades individuais.

cara_duas_vezes <- prob_cara * prob_cara

# Exibir a probabilidade
cat("Probabilidade de sair cara nas duas vezes:", 
    cara_duas_vezes)


#-------------------------------Questão 07--------------------------------
#Qual a probabilidade de tirar um ás de um baralho de 52 cartas

#Total de cartas no baralho
total_cartas <- 52

#Ases no baralho
total_ases <- 4

resul_probabilidade <- total_ases / total_cartas
cat("A probabilidade de tirar um ás é ", round(resul_probabilidade,2))

#-------------------------------Questão 08--------------------------------
#Em uma urna há 5 bolas vermelhas e 3 bolas azuis. Qual a probabilidade 
#de tirar uma bola azul?

#Número total de bolas na urna
total_bolas <- 8

#Número de bolas azuis na urna
bolas_azuis <- 3

prob_bola_azul <- bolas_azuis / total_bolas

cat("A probabilidade de tirar uma bola azul é ", prob_bola_azul)

#-------------------------------Questão 09--------------------------------
#Ao lançar dois dados, qual a probabilidade de a soma dos resultados ser 7?

#O número total de combinações possíveis ao lançar dois dados
# é o produto dos resultados de cada um (número de faces)

total_combinacoes <- 6*6

#Número total de combinações que resultam em 7
#Dado 1 = 1, Dado 2 = 6
#Dado 1 = 2, Dado 2 = 5
#Dado 1 = 3, Dado 2 = 4
#Dado 1 = 4, Dado 2 = 3
#Dado 1 = 5, Dado 2 = 2
#Dado 1 = 6, Dado 2 = 1

combinacoes_soma_sete <- 6

prob_soma_sete <- combinacoes_soma_sete / total_combinacoes
cat("A probabilidade da soma ser igual a 7 é ", round(prob_soma_sete, 4))

#-------------------------------Questão 10--------------------------------
#Em um baralho, qual a probabilidade de tirar um rei ou uma dama?

#Total de cartas no baralho
total_cartas <- 52

#Ases no baralho
total_rei_dama <- 8

resul_probabilidade <- total_rei_dama / total_cartas
cat("A probabilidade de tirar um ás é ", round(resul_probabilidade,2))

#-------------------------------Questão 11--------------------------------
#Em uma urna com 10 bolas, sendo 4 vermelhas e 6 azuis, você retira uma 
#bola, anota a cor e devolve à urna. Em seguida, retira outra bola. Qual 
#a probabilidade de ambas as bolas serem vermelhas?


#-------------------Probabilidade da primeira bola retirada--------------------------------

#Probabilidade 1 -> 4 de 10 - 40%

#-------------------Probabilidade da segunda bola retirada----------------------

#Probabilidade 2 -> 4 de 10 - 40%

#---------------------------Probabilidade combinada-----------------------------
vermelha <- 4/10

result_ambas_vermelhas <- vermelha * vermelha

cat("Probabilidade de ambas serem vermelhas é ", result_ambas_vermelhas)

#-------------------------------Questão 12--------------------------------
#Ao lançar dois dados, qual a probabilidade de obter dois números iguais?

total_combinacoes <- 6*6

#As combinações favoráveis são:
#(1, 1)
#(2, 2)
#(3, 3)
#(4, 4)
#(5, 5)
#(6, 6)

numeros_combin_iguais <- 6

num_faces_iguais <- numeros_combin_iguais / total_combinacoes
cat("A probabilidade de obter dois números iguais é: ", 
    round(num_faces_iguais,2))

#-------------------------------Questão 13--------------------------------
#Em uma urna com 5 bolas vermelhas e 7 bolas azuis, qual a probabilidade 
#de retirar uma bola vermelha, dado que uma bola azul foi retirada e não 
#foi devolvida?

#O número de bolas vermelhas não muda: 5
#O número de boals azuis diminiu em uma unidade: 7 - 1 = 6
#O número total de bolas na urna também diminui em uma: 12 - 1 = 11

vermelhas <- 5
total_bolas_restante <- 11

prob_bola_vermelha <- vermelhas / total_bolas_restante
cat("A probabilidade é: ", round(prob_bola_vermelha,2))

#-------------------------------Questão 14--------------------------------
#Em um baralho completo (52 cartas), você retira duas cartas, uma após a 
#outra, sem devolver a primeira ao baralho. Qual a probabilidade de que 
#ambas as cartas sejam de copas?
  
#----------------------------Etapa 1 - Primeira carta
total_cartas_etapa_01 <- 52
primeira_carta_copas_etapa_01 <- 13
  
#----------------------------Etapa 2 - Primeira carta 
total_cartas_etapa_02 <- 51
primeira_carta_copas_etapa_02 <- 12

prob_primeira_carta_copas <- primeira_carta_copas_etapa_01 / total_cartas_etapa_01
prob_segunda_carta_copas <- primeira_carta_copas_etapa_02 / total_cartas_etapa_02

prob_total <- prob_primeira_carta_copas * prob_segunda_carta_copas
cat("A probabilidade de ambas serem de copas é: ", round(prob_total, 4))
  
  
  








