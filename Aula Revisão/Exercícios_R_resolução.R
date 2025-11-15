#-------------------------------------------------------------------------------
#                               EXERCÍCIO 01
#-------------------------------------------------------------------------------

# Nível de significância (alfa) é 1 - Nível de Confiança (0.95)
erro_maximo <- 0.04 
p <- 0.5 
q <- 1 - p 

# Nível de significância (alfa) é 1 - Nível de Confiança (0.95)
alfa <- 1 - 0.95 
valor_z <- qnorm(1 - alfa/2) # qnorm é a função quantil da distribuição normal padrão.
print(valor_z)

# z <- 1.96


# ----------------------------------------------------
#                 População Infinita
# ----------------------------------------------------

# Fórmula de amostra para População Infinita:
# n = (Z^2 * p * q) / E^2
n_infinito <- (valor_z^2 * p * q) / (erro_maximo^2)

cat("------------------ População Infinita ------------------\n")
cat("Tamanho da Amostra (n) necessário é ", ceiling(n_infinito))# Arredonda para cima


# ----------------------------------------------------
#                   População Finita
# ----------------------------------------------------

# População Total (N)
N_finito <- 2500 

# Fórmula de Amostra para População Finita:
n_finito <- (N_finito * valor_z^2 * p * q) / (N_finito * erro_maximo^2 + valor_z^2 * p * q)

# Exibir o resultado
cat("------------------ População Finita ----------------\n")
cat("Tamanho da Amostra (n) necessário é ", ceiling(n_finito))


#-------------------------------------------------------------------------------
#                               EXERCÍCIO 02
#-------------------------------------------------------------------------------


pop_total <- 5000 
nivel_significancia <- 1 - 0.90 # Nível de significância (alfa)
erro_maximo <- 0.03 # Erro máximo tolerado (E)
prob_p <- 0.5 # Probabilidade esperada de sucesso (p)
prob_q <- 1 - prob_p # Probabilidade complementar (q = 1 - p)
valor_critico_z <- qnorm(1 - nivel_significancia/2) # Valor crítico Z para o Nível de Confiança
print(valor_critico_z)

num_amostra <- pop_total * (valor_critico_z^2) * prob_p * prob_q
den_amostra <- (pop_total * erro_maximo^2 + valor_critico_z^2 * prob_p * prob_q)

n_calculado <- num_amostra / den_amostra # Tamanho da Amostra (n)

n_selecao <- ceiling(n_calculado) # Arredondamento para cima
print(n_selecao)

# ----------------------------------------------------
#               Amostragem Sistemática

# Seleciona elementos em intervalos regulares após
# escolher aleatoriamente o primeiro.

#-----------------------------------------------------

# Criar a lista de identificadores (IDs) de todas as unidades
ids_unidades <- 1:pop_total #c(1,2,3,4...)
print(ids_unidades)

# Calcular o Intervalo de Seleção (k)
intervalo_k <- floor(pop_total / n_selecao) #Arrendoda o valor para baixo
print(intervalo_k)


set.seed(456) #Permite o resultado ser reprodutível

# Seleciona o ponto de partida aleatório, entre 1 e k
# ou seja, o primeiro elemento da amostra
ponto_partida_r <- sample(1:intervalo_k, 1)#Função sample sorteia um número aleatório
print(ponto_partida_r)

# Gera uma sequência numérica de IDs para a amostra sistemática.
amostra_final <- seq(from = ponto_partida_r, 
                     to = pop_total, 
                     by = intervalo_k)

#amostra_final <- amostra_final[1:n_selecao] #Limita a lista de IDs
print(amostra_final)
print(length(amostra_final))


#-------------------------------------------------------------------------------
#                               EXERCÍCIO 05
#-------------------------------------------------------------------------------

# Tópico: Teste t de Student Clássico (Variâncias HOMOGÊNEAS)

# --- 1. Dados Fornecidos pela Questão ---
x_bar1 <- 4.5    # Média da amostra (Grupo 1)
x_bar2 <- 4.9    # Média da amostra (Grupo 2)
n1 <- 30         # Tamanho da amostra (Grupo 1)
n2 <- 35         # Tamanho da amostra (Grupo 2)
variancia_agrupada <- 0.8


numerador <- x_bar1 - x_bar2
denominador <- sqrt((variancia_agrupada / n1) + (variancia_agrupada / n2))

t_student_manual <- numerador / denominador

cat(paste("Estatística T (Manual):", round(t_student_manual, 4)))


# ----------------------------USO DA FUNÇÃO t.test()---------------------------------------


# Nota: A função t.test() requer os vetores de dados completos, não apenas as estatísticas.
# fornecidas
set.seed(5) # Garante a reprodutibilidade dos dados simulados

sd_comum <- sqrt(variancia_agrupada) # Desvio Padrão é a raiz quadrada da variância

grupo_1_dados <- rnorm(n = n1, mean = x_bar1, sd = sd_comum) 
grupo_2_dados <- rnorm(n = n2, mean = x_bar2, sd = sd_comum) 

cat("# --- Execução do Teste t de Student com Variâncias HOMOGÊNEAS ---\n")

# O parâmetro var.equal = TRUE força o uso da variância agrupada (Sp^2), ou seja, confirma
# que é o teste clássico

# Caso o p-value seja menor que 0.05, rejeitamos a H0, concluindo que o tempo médio de espera é diferente
resultado_student <- t.test(grupo_1_dados, grupo_2_dados, var.equal = TRUE) 
print(resultado_student)


#-------------------------------------------------------------------------------
#                               EXERCÍCIO 06
#-------------------------------------------------------------------------------

# Teste t de Welch (Variâncias Heterogêneas)

x_bar1 <- 1.8    # Média da amostra (Composto Alpha)
x_bar2 <- 1.3    # Média da amostra (Composto Beta)
n1 <- 15         # Tamanho da amostra (Composto Alpha)
n2 <- 18         # Tamanho da amostra (Composto Beta)
s1_sq <- 0.45    # Variância amostral (Composto Alpha)
s2_sq <- 0.15    # Variância amostral (Composto Beta)


numerador <- x_bar1 - x_bar2
denominador <- sqrt((s1_sq / n1) + (s2_sq / n2))

t_welch_manual <- numerador / denominador

cat(paste("Estatística T (Manual):", round(t_welch_manual, 3)))


# ----------------------------USO DA FUNÇÃO t.test()---------------------------------------

# Nota: A função t.test() requer os vetores de dados completos, não apenas as estatísticas.

set.seed(123) # Garante a reprodutibilidade dos dados simulados

grupo_alpha <- rnorm(n = n1, mean = x_bar1, sd = sqrt(s1_sq)) 
grupo_beta <- rnorm(n = n2, mean = x_bar2, sd = sqrt(s2_sq)) 

cat("# --- Execução do Teste t de Welch (Padrão para Variâncias Heterogêneas) ---\n")

# Por padrão, t.test() assume var.equal = FALSE, realizando o Teste de Welch.
resultado_welch <- t.test(grupo_alpha, grupo_beta, var.equal = FALSE) 

print(resultado_welch)


#-------------------------------------------------------------------------------
#                               EXERCÍCIO 08
#-------------------------------------------------------------------------------

#--------------------------------IMPORTANTE-------------------------------------

# Amostras muito pequenas, o teste de Shapiro-Wilk tem um poder estatístico 
# baixo para detectar desvios.

gar = c(24, 19, 25, 23, 13) # Garimpeiros
rib = c(16, 8, 10, 7, 15) # Ribeirinhos
ind = c(28, 30, 19, 23, 22) # Índios
cont = c(12, 6, 8, 7, 9) # Controle

# dados
y_dosi = c(gar,rib,ind,cont) # Variável resposta
x_dosi = rep(c("Garimpeiros","Ribeirinhos","Índios","Controle"),each=5) # Variável categórica
dados_dosi = data.frame(y_dosi,x_dosi) 
print(dados_dosi)


# teste de normalidade

# Hipótese Nula: Há evidência estatística de que a variável é normal.

# Hipótese Alternativa. Há evidência de que a variável não segue uma 
# distribuição normal.

# Se p-valor < 0.05: Rejeitamos a H₀.
# Se p-valor > 0.05: Não rejeitamos a H₀.

shapiro.test(gar)

# Poucos pontos em uma amostra gera um gráfico que pode não retratar a realidade
windows()
qqnorm(gar)
qqline(gar)

shapiro.test(rib)
shapiro.test(ind)
shapiro.test(cont)

#teste de homogeneidade das variâncias

# y_dosi ~ x_dosi - (variável_resposta ~ variável_agrupadora): 
# Ela indica que a variável tempo está sendo analisada em 
# relação à variável grupo. 

# Hipótese Nula (H₀): As variâncias são iguais em todos os grupos. 

# Hipótese Alternativa (H₁): diz que pelo menos um dos grupos tem uma 
# variância diferente dos demais.

# Se p-valor < 0.05: Rejeitamos a H₀.
# Se p-valor > 0.05: Não rejeitamos a H₀.

bartlett.test(y_dosi ~ x_dosi, dados_dosi)
boxplot(y_dosi ~ x_dosi, dados_dosi)

boxplot(y_dosi ~ x_dosi, dados_dosi, 
        main="Concentração de Mercúrio por Grupo",
        xlab="Grupo", 
        ylab="Concentração (Unidades)",
        col=c("red", "blue", "green", "gray"))





