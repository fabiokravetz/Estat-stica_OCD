#-------------------------------E1-----------------------------

# Distribuição Normal,  pois o enunciado especifica que a altura 
# das peças segue essa distribuição.

# Para encontrar a probabilidade do intervalo entre 45 e 55, 
# calcula-se a probabilidade acumulada até 55 e subtrai-se a 
# probabilidade acumulada até 45

media <- 50
desvio_padrao <- 5

# Cálculo da probabilidade entre 45 cm e 55 cm
pnorm(55, mean = media, sd = desvio_padrao) - pnorm(45, mean = media, 
                                                    sd = desvio_padrao)


#------------------------------E2-------------------------------
# 2. O tempo de espera em uma fila de atendimento segue uma distribuição 
# exponencial com uma média de 10 minutos. Qual a probabilidade de um 
# cliente ser atendido em menos de 5 minutos?

# q - É o valor de interesse para comparação
q <- 5

# Taxa - Parâmetro da distribuição exponencial que é o inverso da média

taxa = 1/10
pexp(q, rate = taxa)


#------------------------------E3-------------------------------
# Um sorteio é realizado onde um número é selecionado aleatoriamente 
# entre 1 e 100. Qual a probabilidade de o número sorteado ser menor 
# que 30?

#Distribuição uniforme, pois qualquer número entre 1 e 100 tem a mesma
# chance de ser sorteado.

min_val <- 1
max_val <- 100

# Probabilidade do número sorteado ser menor que 30
punif(30, min = min_val, max = max_val)


#------------------------------E4-------------------------------
# O número de acidentes em uma rodovia segue uma distribuição de Poisson 
# com uma média de 2 acidentes por dia. Qual a probabilidade de ocorrer 
# exatamente 3 acidentes em um dia?

# x é o número exato de eventos de interesse, neste caso é 3
x <- 3

# lambda neste caso é a média de acidentes por dia
lambda <- 2

dpois(x, lambda)

#------------------------------E5-------------------------------
# Uma empresa está realizando testes com um novo produto. A chance de 
# um cliente aprovar o produto é de 70%. Se 10 clientes forem selecionados 
# aleatoriamente, qual a probabilidade de exatamente 7 clientes aprovarem o
# produto?

n <- 7
size <- 10
p <- 0.7

dbinom(n, size, prob <- p)

#------------------------------E6-------------------------------
# Um aluno realiza um teste com apenas duas possíveis respostas: certo ou errado. 
# A probabilidade de acerto é de 80%. Qual a probabilidade de o aluno acertar a questão?

p <- 0.8
dbinom(1, size = 1, prob = p)

#------------------------------E7-------------------------------
# Em uma turma de 100 alunos, as notas da última prova variaram. 
# A média das notas foi de 70, e o desvio padrão foi de 10. Qual 
# a probabilidade de um aluno escolhido aleatoriamente ter obtido 
# uma nota entre 60 e 80?

media <- 70
desvio_padrao <- 10

# Cálculo da probabilidade entre 60 cm e 80 cm
pnorm(80, mean = media, sd = desvio_padrao) - pnorm(60, mean = media, 
                                                    sd = desvio_padrao)
 
 
#------------------------------E8------------------------------- 
# Um cliente pode chegar a qualquer momento entre 9h e 17h. 
# Um gerente quer saber mais sobre a distribuição do horário de 
# chegada dos clientes. Qual a probabilidade de o cliente chegar 
# entre 10h e 12h, dado que ele pode chegar a qualquer momento dentro 
# do intervalo de tempo disponível?


# Distribuição Uniforme, já que a chegada pode ocorrer 
# "a qualquer momento" dentro do intervalo, implicando que 
# todos os momentos são igualmente prováveis.

min_val <- 9
max_val <- 17

# Cálculo da probabilidade de o cliente chegar entre 10h e 12h
prob <- (12 - 10) / (max_val - min_val)
print(prob)

#------------------------------E9------------------------------- 
# Em uma pesquisa sobre preferências de trabalho, 40% dos 
# entrevistados preferem trabalhar remotamente. O gerente de 
# recursos humanos decide entrevistar 8 pessoas aleatórias da 
# empresa para entender a tendência. Qual a chance de exatamente 
# 5 dessas pessoas preferirem trabalhar remotamente?

# Distribuição Binomial, pelos mesmos motivos do Exercício 5 
# (número fixo de tentativas, dois resultados, probabilidade 
# constante).

n <- 8
p <- 0.4
k <- 5

# Cálculo da probabilidade de exatamente 5 pessoas preferirem trabalhar remotamente
dbinom(k, size = n, prob = p)


#------------------------------E10-------------------------------
# Uma fábrica deseja saber a confiabilidade de suas lâmpadas, 
# sabendo que a vida útil média de uma lâmpada fabricada por eles 
# é de 1000 horas. Qual a chance de uma lâmpada escolhida 
# aleatoriamente durar mais de 1200 horas?


# Distribuição Exponencial - Problemas que modelam o tempo de 
# vida ou a durabilidade de um item frequentemente utilizam esta 
# distribuição.

# Dados
media <- 1000
taxa <- 1 / media

# Cálculo da probabilidade de uma lâmpada durar mais de 1200 horas
exp(-taxa * 1200)


#------------------------------E11-------------------------------
# Uma central de atendimento recebe um certo número de chamadas 
# por hora. Historicamente, a média de chamadas recebidas por 
# hora é de 15. Qual a probabildade de a central receber 
# exatamente 20 chamadas em uma hora?


#------------------------------E12-------------------------------
# Uma loja de doces afirma que a proporção de cores em seus 
# pacotes de balas é a seguinte: 30% vermelhas, 20% verdes, 
# 20% amarelas, 15% azuis e 15% rosas. Um cliente desconfiado 
# compra um pacote grande com 300 balas e encontra a seguinte 
# distribuição: 85 vermelhas, 65 verdes, 55 amarelas, 40 azuis 
# e 55 rosas. Utilizando um teste qui-quadrado com nível de 
# significância de 5%, é possível afirmar que a distribuição de 
# cores no pacote condiz com a proporção informada pela loja?


# Distribuição - Qui-Quadrado. Este teste é ideal para comparar 
# frequências observadas com frequências esperadas para 
# determinar se as diferenças são estatisticamente significativas

# Frequências observadas no pacote de 300 balas
observado <- c(85, 65, 55, 40, 55)

# Proporções esperadas informadas pela loja
proporcoes <- c(0.30, 0.20, 0.20, 0.15, 0.15)

# Cálculo do valor crítico e da estatística do teste
resultado_teste <- chisq.test(x = observado, p = proporcoes)
print(resultado_teste)



#------------------------------E13-------------------------------
# Uma empresa farmacêutica desenvolveu um novo medicamento para 
# reduzir a pressão arterial. Ela afirma que o medicamento reduz 
# a pressão sistólica em uma média de 10 mmHg. Para testar essa 
# afirmação, um estudo foi conduzido com 15 pacientes, e as 
# reduções observadas foram: 8, 12, 10, 15, 6, 9, 11, 13, 10, 9, 
# 14, 7, 11, 12, 8. Com base nesta amostra, podemos concluir que 
# a afirmação da empresa é estatisticamente válida? (Use um nível 
# de significância de 5%).


#-------------------------INTERPRETAÇÃO-------------------------

# Distribuição: t de Student. Esta distribuição é usada para 
# testes de hipóteses sobre a média de uma população quando o 
# tamanho da amostra é pequeno (tipicamente n < 30) e o 
# desvio padrão da população é desconhecido.

# O t.test compara a média da amostra (mean of x) com a média 
# hipotética (mu). Ele calcula a estatística de teste t e o 
# p-valor (p-value). A interpretação é semelhante à do teste 
# qui-quadrado:

#-------------------------INTERPRETAÇÃO---------------------------

# Se o p-valor for menor que o nível de significância (0.05), 
# rejeita-se a hipótese de que a média populacional é igual a 10. 
# Conclui-se que a redução média causada pelo medicamento é 
# estatisticamente diferente de 10 mmHg.


# Se o p-valor for maior que o nível de significância (0.05), 
# não há evidências para rejeitar a hipótese nula. Isso sugere 
# que a afirmação da empresa (redução média de 10 mmHg) é 
# plausível com base nos dados da amostra.

# Dados da amostra de reduções da pressão arterial
reducoes <- c(8, 12, 10, 15, 6, 9, 11, 13, 10, 9, 14, 7, 11, 12, 8)

# Média populacional que se deseja testar (hipótese nula)
media_hipotese <- 10

# Realização do teste t para uma amostra
resultado_teste <- t.test(x = reducoes, mu = media_hipotese)
print(resultado_teste)













  
  
  
  
  
  
  
  
  





