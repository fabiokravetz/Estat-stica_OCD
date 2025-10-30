# install.packages("tidyverse")
# library(tidyverse)
# d = read.csv(summary(round(function())))

#------------------------VARIÁVEIS----------------------
#A linha abaixo diz que a recebe o valor 10
a <- 10
a

a <- 12

b <- "João"
B

#Ocorre um erro ao tentar executar o comando abaixo,
#pois c-> 10 tem o lado apontamento errado. Desse 
#modo, estou dizendo que quero atribuir a variável
#"c", que nem existe ainda ao valor (número) 10
#c -> 25

10 -> c
c

c -> d
d

#--------------ALTERAÇÃO VALOR VARIÁVEIS------------
a <- 10
b <- 5

c <- a + b
a
b
c

#Sobrescrevendo as variáveis "a" e "b"
a <- "Pedro"
b <- "Felipe"

c <- a + b

#--------------Introdução funções------------------
#Help para funções na linguagem R
?c
#Concatenação de valores
var_c <- c(a,b)
var_c

var_c <- c("Lívia", "Luiza")
var_c

var_d <- c(1,2,3,4)
var_d

?summary
summary(var_d)

#---------------Instalação pacote externo------------
# install.packages("stringr")
# library(stringr)
# ?str_c

#Concatenando valores com a função str_c
nome <- "João"
sobrenome <- "Silva"

nomeCompleto <- str_c(nome, sobrenome)
nomeCompleto

#Melhorando concatenação acima
nomeCompleto <- str_c(nome, " ", sobrenome)
nomeCompleto

#---------Operações matemática e comparações-------
#Adição
soma <- 7 + 12
soma

soma_com_func <- sum(23,7)
soma_com_func

#Subtração
subtrac <- 3-4
subtrac

#Multiplicação
multiplic <- 7*8
multiplic

#Divisão
divisao <- 9/4
divisao

#Potenciação
pot_01 = 4 ** 2
pot_01
pot_02 <- 4 ^ 3
pot_02

#Operadores de comparação
#igual
45 == 40

#Diferente
7 != 8
4 != 4

#Maior
11 > 3

#Menor
3 < 6

#Maior ou igual
11 >= 8
11 >= 11

#Menor ou igual
10 <= 5

#Operador AND (E)
5 > 3 & 7 != 6

#Operador OR (OU)
6 != 6 | 7 == 7

#--------------Armazenamento numérico--------------
salario <- 4589.88
horas <- 220

sh <- salario/horas
sh

#E se eu quiser somente um valor inteiro? Usar
#a função as.integer
sh_inteiro <- as.integer(sh)
sh_inteiro

#Realizando arredondamento do valor sh
sh_arredondamento <- round(sh)
sh_arredondamento

#E seu quiser arredondar com 2 casas decimais
sh_arredondamento_decimal <- round(sh,2)
sh_arredondamento_decimal

#-------------Armazenamento de fatores-------------
#Vamos imaginar que os parâmetros não são números,
#mas sim categorias (Categorias de horários)
cargaHoraria <- c(220, 220, 150, 100, 100)
cargaHoraria

#Para categorizar valores utiliza-se a função
#as.factor(). Observar que ao executar a linha
#de comando abaixo o tipo da variável vai mudar.
cargaHoraria <- as.factor(cargaHoraria)
cargaHoraria
class(cargaHoraria)
mode(cargaHoraria)
typeof(cargaHoraria)
summary(cargaHoraria)

#-------------------Vetores---------------------
vetor <- c(1,2,3,4,5)
vetor
is.vector(vetor)

#Realizar a soma em um vetor
soma_vetor <- sum(vetor)
soma_vetor

#Obtendo o conteúdo (valor) da posição 3 do vetor
vetor[3]

#E se eu quiser pegar o primeiro e último valor?
vetor[c(1,5)]

#Supondo que foi inserido um valor errado na
#quinta posição do vetor, como alterar?
vetor[5] <- 13

#--------------------Lista----------------------
#Lista pode ser definida como um vetor com tipos
#diferentes de dados
j <- c(5,7,9,12)
j
is.list(j)

k <- c(1, "45", 22, 15)
k
is.list(k)

#Transformar o vetor para o tipo numérico
k <- as.numeric(k)
k

#---------------------------------------
m <- list(10, "35", 12, 7)
m
is.list(m)
mode(m)
str(m)

#-------------------IF, ELSE, FOR e WHILE-----------------
#Se algo é verdade faça tal coisa
a <- 30
b <- 33
c <- 0
if(a == b){
  c <- a + b
}

#se senão - Forma 1 - condições + complexas
x <- 4
y <- 4

if(x == y){
  11+11
}else
{
  "As variáveis possuem valores diferentes."
}

#se senão - Forma 2 - condições simples
if(x == y) 15 + 15 else "As variáveis possuem valores diferentes."

#----------------------------------Operador ternário------------------------------
#(condição ? valor_se_verdadeiro : valor_se_falso)

#A sintaxe na linguagem R é a seguinte:
#ifelse(teste_logico, valor_se_verdadeiro, valor_se_falso)

#EXEMPLO: Atribuir a maior idade ou menor idade com base em uma variável
#idade

idade <- 15
maiorMenor <- ifelse(idade >= 18, "Maior de Idade", "Menor de Idade")
print(maiorMenor)

#Repita o exercício anterior para as idades 9, 20, 17, 33, 66
idades <- c(9, 20, 17, 33, 66)
status_idades <- ifelse(idades >= 18, "Maior de Idade", "Menor de Idade")
print(status_idades)

#----------------------------------SWITCH---------------------------------------
#switch(expressao,
#       "caso_01" = {bloco 01 de código},
#       "caso_02" = {bloco 02 de código},
#       "caso_03" = {bloco 03 de código},
#        valor padrao -> Opcional - É selecionada quando nenhuma das
#                                   condições anteriores é atendida
#)

tipo_idioma <- function(idioma){
  switch (idioma,
          "Brasil" = "Português",
          "China" =  "Mandarim",
          "Estados Unidos" = "Inglês",
          "Não conheço este idioma!!!"
  )
}
print(tipo_idioma("França"))

#-----------------------------------DATA FRAMES-----------------------------------
#É uma estrutura bidimensional: Possui linhas e colunas
#Colunas representam as variáveis (ex: nomes, idades, salários)
#Linhas representam as observações ou registros

#HELP para verificar função no Rstudio
?data.frame
vetor_03 <- c(12, 24, 36, 48)
vetor_04 <- c("moto", "carro", "barco", "avião")

tabela <- data.frame(quantidade = vetor_03, nomes = vetor_04)
print(tabela)

#Como acessar a coluna quantidade
tabela$quantidade
tabela$nomes

#-----------------------------------------------------------------
nomes <- c("Felipe", "Márcia")
idades <- c(25, 19)

tab_pessoas <- data.frame(nomes, idades)
print(tab_pessoas)

#IF ELSE - VERSÃO 01
#Descubra quem é a pessoa mais velha
if(tab_pessoas$idades[tab_pessoas$nomes == "Felipe"] > 
   tab_pessoas$idades[tab_pessoas$nomes == "Márcia"]){
  "Felipe é mais velho que Márcia"
}else{
  "Márcia é mais velha que Felipe"
}

#IF ELSE - VERSÃO 02
idades <- c(25, 52, 24, 29, 35, 48, 13)
nomes <- c("Felipe", "Márcia", "Leonardo", "Lívia", "João",
           "Eduardo", "Rafael")
tab_pessoas <- data.frame(nomes, idades)
print(tab_pessoas)

#Laço de repetição for - Versão 01

#i é uma variável criada que é o conteúdo da posição do vetor
#Ainda não estamos considerando o data frame

for (i in idades){
  print(i)
}
#-----------------------Solução para o caso acima----------------
#1º - Criar uma variável para armazenar a maior idade
k <- 0

for(i in tab_pessoas$idades){
  if(i > k){
    k <- i
  }
}
tab_pessoas$nomes[tab_pessoas$idades == k]
#---------------Laço de repetição while-------------------
#Enquanto é verdade execute uma ação
j <- 0
while(j < 10){
  print(j)
  j <- j + 1
}

#1) Elabore um código em R que recebe um número e imprime em tela
#se o número é positivo, negativo ou zero.

#numero <- 0
numero <- as.numeric(readline("Digite um número: "))

if (numero > 0){
  print("Positivo")
}else if (numero < 0){
  print("negativo")
}else{
  print("O número é igual a zero")
}
  
#2)Dado o vetor de números abaixo:
#numeros <- c(2, 5, 8, 10, 3, 6)
#Utilize um loop FOR para contar quantos números são pares
#e quantos são ímpares.

numeros <- c(2, 5, 8, 10, 3, 6)
contadorPar <- 0
contadorImpar <- 0

for(num in numeros){
  if(num %% 2 == 0){
    contadorPar <- contadorPar + 1
  }else{
    contadorImpar <- contadorImpar + 1
  }
}
print(paste("Total de números pares é: ", contadorPar))
print(paste("Total de números ímpares é: ", contadorImpar))

#3)Dado um vetor qualquer (valores <- c(3, -1, 7, -4, 9)), 
#substitua os números negativos por "NEGATIVO" e os números
#positivos por "POSITIVO"

valores <- c(3, -1, 7, -4, 9)
valores_modificados <- ifelse(valores < 0, "NEGATIVO", "POSITIVO")

print("Vetor original:")
print(valores)
print("Vetor modificado:")
print(valores_modificados)






























































































































































































