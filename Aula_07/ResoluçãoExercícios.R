#---------------------População infinita----------------------

# Qual o número mínimo de pessoas que é preciso entrevistar
# para ter 95% de confiança e um erro de 5%, assumindo que a 
#população é muito grande (como todos os habitantes de um País)?

# Proporção (probabilidade) estimada do evento de interesse na população
p <- 0.5

# Erro máximo desejado
e <- 0.05

# Valor crítico para um nível de confiança de 95%
Z <- 1.96

# Calcular o tamanho da amostra

n <- ceiling((Z^2 * p * (1 - p)) / e^2)

print(n)

# -------------------------População finita-------------------------
# Sabendo que existem 1000 pessoas em uma universidade, quantas eu 
# preciso entrevistar para ter a mesma confiança e erro do exercício
# anterior.

# Tamanho da população
N <- 1000

# Proporção estimada do evento
p <- 0.5

# Erro máximo desejado
e <- 0.05

# Valor crítico para um nível de confiança de 95%
Z <- 1.96

n <- ceiling((N * Z^2 * p * (1 - p)) / (N * e^2 + Z^2 * p * (1 - p)))

# --------------------------Cálculo - AMOSTRAGEM ALEATÓRIA SIMPLES------------------------------
# Uma empresa de consultoria com 1000 funcionários deseja realizar uma pesquisa interna
# para avaliar a satisfação dos funcionários. O RH precisa garantir que a pesquisa seja
# estatisticamente válida.

# Amostragem aleatória simples: Onde cada funcionário tem a mesma chance de ser escolhido.

# 1. Calcule o tamanho da amostra necessária para a pesquisa. Nível de confiança deve ser
# de 95%

Z <- 1.96 # nível de confiança de 95%
p <- 0.5
N <- 1000
e <- 0.05

n <- ceiling((N * Z^2 * p * (1 - p)) / (N * e^2 + Z^2 * p * (1 - p)))
print(n)


#-------------------------------------------------------------------------------
#2. Gerar uma primeira lista de participantes (IDs de 1 a 1000) 
# utilizando o método de Amostragem Aleatória Simples.

# A linha do sample é que seleciona os funcionários.

# sample(): É a função do R para realizar sorteios e amostragens.

# 1:N - Atalho que significa um vetor c de 1 a 1000.

# n - Tamanho da amostra

# Realizar a amostragem aleatória simples
amostra <- sample(1:N, n, replace = FALSE)

print(amostra)
length(amostra)


#-----------------------------------------------------------------
#3. Gerar uma segunda lista de participantes, como alternativa, 
# utilizando o método de Amostragem Sistemática. Para isso, você 
# deve primeiro calcular o intervalo de amostragem (k) e, em 
# seguida, construir a lista de IDs (funcionários) selecionados.

# Amostragem Sistemática: Onde os funcionários, neste caso, são escolhidos 
# em intervalos fixos.

# Nesta seção, o processo é repetido, mas com uma técnica de 
# seleção diferente, baseada em intervalos.

# Tamanho da população
N <- 1000

# Tamanho da amostra desejada
n <- ceiling((N * Z^2 * p * (1 - p)) / (N * e^2 + Z^2 * p * (1 - p)))
print(n)

# k é a razão entre o tamanho da população (N) e o tamanho da 
# amostra (n). k é o intervalo de amostragem.

# Calcular o intervalo de amostragem
# k = 1000 / 278
k <- ceiling((N / n))
print(k)

# Cálculo amostragem sistemática
amostra_sistematica <- seq(from = 1, to = N, by = k)

print(amostra_sistematica)

length(amostra_sistematica)

# ------------------------------Cálculo - ESTRATOS E CONGLOMERADOS--------------------------

#-------------------------------Tamanho da população por estrato---------------------------

estrato_A <- 500
estrato_B <- 300
estrato_C <- 200

# Tamanho da amostra total desejada, ou seja, define que o objetivo final
# é obter uma amostra total com 100 estudantes
n_total <- 100

# Aqui é calculada a quantidade de alunos a ser selecionada de cada estrato
# para manter a proporcionalidade
n_A <- ceiling((estrato_A / 1000) * n_total)
n_B <- ceiling((estrato_B / 1000) * n_total)
n_C <- ceiling((estrato_C / 1000) * n_total)

# Gerar uma amostra aleatória de IDs (pessoas) para cada estrato
set.seed(123)
amostra_A <- sample(1:estrato_A, n_A)
amostra_B <- sample(1:estrato_B, n_B)
amostra_C <- sample(1:estrato_C, n_C)

#Exibição dos valores
cat("Amostra do estrato A:", amostra_A, "\n")
cat("Amostra do estrato B:", amostra_B, "\n")
cat("Amostra do estrato C:", amostra_C, "\n")


# ------------------------------AMOSTRAGEM POR CONGLOMERADOS--------------------------

#Número de conglomerados

#Criação de uma variável para representar o número total de
#conglomerados existentes, que neste caso são 10 campi de uma universidade
conglomerados <- 10

#Define que o objetivo é selecionar aleatoriamente 3 desses conglomerados
num_selecionados <- 3

set.seed(123)
conglomerados_selecionados <- sample(1:conglomerados, num_selecionados)

#Exibir os conglomerados selecionados
cat("Conglomerados selecionados: ", conglomerados_selecionados, "\n")

#Em uma população de 10.000 indivíduos, deseja-se estimar a proporção de pessoas
#que usam um determinado serviço. Sabendo que a proporção esperada é de 40%, com
#um erro máximo de 5% e nível de confiança de 95%, calcule o tamanho da amostra
#necessária e selecione a amostra aleatória simples.

#Z <- 1.96 # nível de confiança de 95%
Z <- qnorm(1-0.05/2)
#cat("O valor crítico é: ", Z)
p <- 0.4
N <- 10000
e <- 0.05

n <- ceiling((N * Z^2 * p * (1 - p)) / (N * e^2 + Z^2 * p * (1 - p)))
cat("O tamanho da amostra necessária é: ", n, "\n")

#Selecionar uma amostra aleatória simples
set.seed(123)
amostra_aleatoria <- sample(1:N, n)
#Exibe os números escolhidos aleatoriamente a partir do tamanho da população (N)
print(amostra_aleatoria)
length(amostra_aleatoria)

#Uma cidade com 15.000 habitantes é dividida em três regiões: 
#região A (60% da população), região B (25% da população) e 
#região C (15% da população). Deseja-se realizar uma pesquisa 
#com margem de erro de 3% e nível de confiança de 95%. Determine
#o tamanho da amostra total e a amostra proporcional de cada estrato,
#e selecione as amostras.

N <- 15000 # População total
Z <- 1.96  # nível de confiança de 95%
p <- 0.5   # Proporção estimada de sucesso
e <- 0.03  # Erro máximo permitido

n_total <- ceiling((N * Z^2 * p * (1 - p)) / (N * e^2 + Z^2 * p * (1 - p)))
cat("O tamanho da amostra total é: ", n, "\n")

#Calcular o tamanho da amostra proporcional para cada estrato (região)
#Proporções da população.
proporcao_A <- 0.60
proporcao_B <- 0.25
proporcao_C <- 0.15

n_A <- ceiling(n_total * proporcao_A)
n_B <- ceiling(n_total * proporcao_B)
n_C <- ceiling(n_total * proporcao_C)

#Tamanho da amostra por região

cat("Tamanho da amostra para região A:", n_A, "\n")
cat("Tamanho da amostra para região B:", n_B, "\n")
cat("Tamanho da amostra para região C:", n_C, "\n")

#Uma empresa possui um banco de dados com 1.000 clientes e deseja realizar 
#uma pesquisa de satisfação. A empresa precisa selecionar uma amostra de 
#clientes para serem entrevistados, de forma sistemática (intervalos fixos). Para garantir uma 
#margem de erro de 5% e um nível de confiança de 95%, considere que a proporção 
#esperada de clientes satisfeitos é de 50%.


# Tamanho da população de clientes
N <- 1000

# Proporção estimada de clientes satisfeitos (50%)
p <- 0.5

# Erro máximo permitido (5%)
e <- 0.05

# Nível de confiança de 95% - valor crítico da distribuição normal
Z <- 1.96

# Calcular o tamanho da amostra ajustado para a população finita
n <- ceiling((N * Z^2 * p * (1 - p)) / (N * e^2 + Z^2 * p * (1 - p)))

# Exibir o tamanho da amostra calculado
cat("Tamanho da amostra necessário:", n, "\n")

# Calcular o intervalo de amostragem (a cada quantos clientes será feita a seleção)
k <- ceiling(N / n)
print(k)

# Selecionar a amostra sistemática (selecionar clientes a cada intervalo k)
amostra_sistematica <- seq(from = 1, to = N, by = k)

# Exibir os clientes selecionados para a amostra
cat("Clientes selecionados para a amostra:", amostra_sistematica, "\n")

# Exibir o número de elementos na amostra
cat("Número de elementos na amostra:", length(amostra_sistematica), "\n")
























