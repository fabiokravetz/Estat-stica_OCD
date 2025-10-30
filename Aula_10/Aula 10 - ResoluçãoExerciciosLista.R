#------------------------------QUESTÃO 01-----------------------------

# "Diferente" significa que não nos importamos se é maior ou menor; 
# ambos são "extremos". Isso é um teste bilateral.

# Como o teste é bilateral (e a curva é simétrica), a área à direita 
# de +2 é exatamente a mesma.

# Portanto, pegamos o resultado de pt() e multiplicamos por 2 para 
# obter a probabilidade total das duas caudas (extremos).

# A função pt(q, df) calcula a probabilidade de obter um valor igual 
# ou menor que um determinado valor q (t_stat1), assumindo que a variável 
# segue uma distribuição t de Student com graus de liberdade (df1).

t_stat1 <- -2   # Estatística T calculada
df1 <- 15       # Graus de liberdade (n - 1)
alpha1 <- 0.05  # Nível de significância

# p-valor
cauda_esquerda <- pt(t_stat1, df = df1)

# Como H1 é "diferente de" (bilateral), multiplicamos por 2 para
# incluir a probabilidade da cauda direita
p_value1 <- cauda_esquerda * 2

print(paste("Estatística T:", t_stat1))
print(paste("P-Valor:", round(p_value1, 4)))

if (p_value1 <= alpha1) {
  print("Rejeitar H0.")
} else {
  print("Falha em rejeitar H0.")
}

#------------------------------QUESTÃO 02-----------------------------

# Quando as variâncias são diferentes (heterogêneas), não podemos 
# simplesmente somar os graus de liberdade. Precisamos usar uma fórmula 
# especial chamada Aproximação de Welch-Satterthwaite. Tal fórmula não
# será apresentada nesta disciplina.

t_stat2 <- 2.84   # Estatística T calculada
df2 <- 42.699     # Graus de liberdade (calculado via Welch)
alpha2 <- 0.05    # Nível de significância

# 2. Calcular o p-valor (Teste Bilateral)
# H1 é "diferente de", então precisamos das duas caudas.
# Como T é igual a 2.84 e, é positivo, calculamos a área à 
# DIREITA e multiplicamos por 2.

# lower.tail = TRUE (É o padrão): Significa que a função calcula a 
# probabilidade da cauda inferior (esquerda)

# lower.tail = FALSE: Significa que a função calcula a  probabilidade 
# da cauda superior (direita)
cauda_direita <- pt(t_stat2, df = df2, lower.tail = FALSE)

# Multiplicamos por 2 para um teste bilateral
p_value2 <- cauda_direita * 2

# 3. Resultados
print(paste("Estatística T:", t_stat2))
print(paste("P-Valor:", round(p_value2, 4))) # Resultado: 0.0068

# 4. Decisão
if (p_value2 <= alpha2) {
  print("Decisão: Rejeitar H0. Há uma diferença significativa.")
} else {
  print("Decisão: Falha em rejeitar H0.")
}

#------------------------------QUESTÃO 03-----------------------------

t_stat3 <- 9.49   # Estatística T calculada
df3 <- 9          # Graus de liberdade (n - 1) = (10 - 1)
alpha3 <- 0.05    # Nível de significância

# Calcular o p-valor (Teste Unilateral à Direita)
# Como H1 é "maior que", queremos a probabilidade P(T >= 9.49).
# Isso é exatamente o que `lower.tail = FALSE` calcula.
p_value3 <- pt(t_stat3, df = df3, lower.tail = FALSE)

# Como é um teste unilateral não multiplicamos por 2

print(paste("Estatística T:", t_stat3))
print(paste("P-Valor:", p_value3)) # Notação científica: 3.39...e-06

if (p_value3 <= alpha3) {
  print("Rejeitar H0. O treinamento foi eficaz.")
} else {
  print("Falha em rejeitar H0.")
}

#------------------------------QUESTÃO 04-----------------------------

techmax <- c(18, 20, 21, 19, 22, 17, 20, 21)     
connectpro <- c(16, 18, 15, 17, 19, 16, 18)  
alpha <- 0.05  # Nível de significância

# Teste T
# A função t.test() é projetada para pegar esses vetores 
# de dados brutos e fazer todo o trabalho

# Ela calcula a média, variância, desvio padrão de cada grupo
# Ela calcula os graus de liberdade, a estatística T e o
# p-valor.

#
# O que cada parte significa:
#   techmax, connectpro  -> os dois grupos que queremos comparar
#   var.equal = FALSE    -> diz ao R que as variâncias são diferentes
#                           (heterogêneas), como o problema pede.
#   alternative = "two.sided" -> diz ao R que nossa H1 é "diferente de".
#
teste_bateria <- t.test(techmax, connectpro, 
                        var.equal = FALSE, 
                        alternative = "two.sided")

# 4. Exibir o resultado
print(teste_bateria)

# Se p-valor ≤α: Rejeite H0 (o resultado é significativo).
# Se p-valor > α: Falhe em rejeitar H0 (o resultado não é significativo).

