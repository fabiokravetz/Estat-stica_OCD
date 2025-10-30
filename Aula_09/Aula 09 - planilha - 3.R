library(stats)
library(readxl)
library(plotly)

file.choose()
rota_planilha <- "C:\\Users\\fabio\\OneDrive\\Área de Trabalho\\Curso estatística - Linguagem R\\Aula 09\\pressupostos.xlsx"
excel_sheets(rota_planilha)

#dados <- read_excel(rota_planilha)
dados_aba1 <- read_excel("C:\\Users\\fabio\\OneDrive\\Área de Trabalho\\Curso estatística - Linguagem R\\Aula 09\\pressupostos.xlsx", 
                         sheet = "normalidade")
dados_aba2 <- read_excel("C:\\Users\\fabio\\OneDrive\\Área de Trabalho\\Curso estatística - Linguagem R\\Aula 09\\pressupostos.xlsx", 
                         sheet = "bartlett1")
#dados_aba3 <- read_excel("seu_arquivo.xlsx", sheet = "NomeDaAba")
#head(dados)
head(dados_aba1) # Armazenamento dos dados no RStudio
head(dados_aba2)

# shapiro.test(...): Como visto na análise anterior, esta função realiza 
# o Teste de Shapiro-Wilk, que avalia a hipótese nula de que os dados 
# foram amostrados de uma população normalmente distribuída.

# Se p-valor > 0.05: Não rejeitamos a hipótese nula. Não há 
# evidência estatística de que a variável não seja normal.

# Se o p-valor < 0.05: Rejeitamos a hipótese nula. Há evidência de 
# que a variável não segue uma distribuição normal.

# Um valor de W próximo de 1 indica que os dados se ajustam muito bem 
# a uma distribuição normal.

shapiro.test(dados_aba1$horas)

# Comprovação da normalidade por meio de um histograma
plot_ly(x = ~dados_aba1$horas, type = 'histogram') %>%
  layout(
    title = "Histograma de Horas de Estudo",  # Título principal
    xaxis = list(
      title = "Horas",
      range = c(5, 18)  
    ),
    yaxis = list(
      title = "Frequência" 
    )
  )


shapiro.test(dados_aba1$nota1)
shapiro.test(dados_aba1$nota2)

# Gráfico

# qqnorm(dados$horas): Esta função cria um Gráfico Quantil-Quantil (Q-Q) 
# para a variável horas. 

# qqline(dados$horas): Adiciona uma linha de referência reta ao 
# gráfico Q-Q.

# Interpretação: A inspeção visual é feita para ver se os pontos 
# plotados se alinham com a linha reta. O código exibe o gráfico Q-Q apenas 
# para a variável horas, mas o mesmo procedimento poderia ser 
# replicado para nota1 e nota2.

qqnorm(dados_aba1$nota1)
qqline(dados_aba1$nota1)

# Teste de Homogeneidade de Variâncias

# bartlett.test(...): Este comando realiza o Teste de Bartlett. 
# Verifica se a variância de uma variável quantitativa (tempo) é a 
# mesma em diferentes grupos (grupo).

# tempo ~ grupo: Ela indica que a variável tempo está sendo analisada em 
# relação à variável grupo. 

# Hipótese Nula (H₀): As variâncias são iguais em todos os grupos. 

# Hipótese Alternativa (H₁): diz que pelo menos um dos grupos tem uma 
# variância diferente dos demais.

# df = 4: Os "graus de liberdade" indicam que sua variável grupo tem 5 
# categorias (df = k - 1, onde k é o número de grupos).

# p-value representa a probabilidade de observar um resultado 
# tão ou mais extremo que o atual, assumindo que a hipótese nula 
# (variâncias iguais) seja verdadeira.


#-----------------------------------------------------------------------

# Cada um dos 5 grupos (definidos pela variável grupo) 
# tem a sua própria variância para a variável tempo.

# O Teste de Bartlett compara essas 5 variâncias diferentes para ver se 
# elas são estatisticamente iguais.

# Um valor de K-squared próximo de zero  indica 
# que as variâncias dos seus grupos são muito parecidas.

# Um valor de K-squared alto indica que há uma grande diferença 
# entre as variâncias dos grupos.

# O K-squared é um valor único calculado a partir de todas as variâncias 
# dos seus grupos.

# Se p-valor < 0.05: Rejeitamos a H₀.
# Se p-valor > 0.05: Não rejeitamos a H₀.

#-----------------------------------------------------------------------

bartlett.test(tempo ~ grupo, data = dados_aba2)
boxplot(tempo ~ grupo, data = dados_aba2)
