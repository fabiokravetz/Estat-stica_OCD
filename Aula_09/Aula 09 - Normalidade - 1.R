#----------------------NORMALIDADE----------------------
install.packages('plotly')
library(plotly)

# Dados normais
set.seed(123)  # Para tornar os resultados reproduzíveis

# rnorm(): É a função do R para gerar números aleatórios que 
# seguem uma distribuição Normal.
dados_normais <- rnorm(50, mean = 0, sd = 1)

windows() #Abre uma janela para apresentar o gráfico
hist(dados_normais) #Cria um gráfico histograma

#Gráfico interativo - Histograma
plot_ly(x=dados_normais, type = 'histogram')

#QQ-Plot
#qqnorm(dados_normais):Gera um gráfico QQ (Quantil-Quantil) normal.
#Plota os quantis dos dados de nossa distribuição contra os quantis 
#teóricos de uma distribuição normal perfeita.

#Eixo Y: Pega todos os 50 pontos gerados na função rnorm, armazenados
#na variável dados_normais e ordena do menor para o maior. 

#Eixo X: São calculados os 50 pontos teóricos.

windows()
qqnorm(dados_normais)
qqline(dados_normais)

#Salvar os dados do gráfico em uma variável
dados_plot <- qqnorm(dados_normais)
print("Quantis teóricos - Eixo x: ")
print(dados_plot$x)

print("Quantis teóricos - Eixo y: ")
print(dados_plot$y)

#--------------------------------------------------------------------
#shapiro.test(dados_normais) - Teste de Shapiro-Wilk
#As hipóteses do teste são:

#Hipótese nula (H0): Os dados vieram de uma população com
#distribuição normal.

#Hipótese alternativa (H1): Os dados não vieram de uma população
#com distribuição normal.

#Como interpretar tal valor? Utilizar o p-valor

#O p-valor < 0.05 sugere que os dados são improváveis de ocorrer
#sob a hipótese nula, o que nos leva a questionar a validade da
#hipótese nula.

#O p-valor > 0.05 sugere que os dados são compatíveis com a hipótese
#nula.

#Um valor de W próximo de 1 indica que os dados se ajustam muito bem
#a uma distribuição normal.

shapiro.test(dados_normais)


#----------------------------NÃO-NORMALIDADE---------------------------

set.seed(456)

dados_nao_normais <- rgamma(50, shape = 2, scale = 1)

#Histograma
windows()
hist(dados_nao_normais)

#QQ-Plot
windows()
qqnorm(dados_nao_normais)
qqline(dados_nao_normais)

shapiro.test(dados_nao_normais)

#------------------------------------------------------------











