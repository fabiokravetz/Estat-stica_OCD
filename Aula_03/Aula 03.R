#ploty: Biblioteca para criar gráficos interativos

#dplyr: Biblioteca para transformação de dados, como
      # filtrar, agrupar e resumir dados.

install.packages('plotly')
install.packages('dplyr')
install.packages('readxl')

library(readxl)
library(plotly)
library(dplyr)

file.choose()
rota_planilha <- "C:\\Users\\fabio\\OneDrive\\Área de Trabalho\\Curso estatística - Linguagem R\\Aula 03\\salarios.xlsx"
excel_sheets(rota_planilha)

dados <- read_excel(rota_planilha)
head(dados)

#dados %>% significa - Pegue uma tabela de dados e prepare-se para 
#fazer algo com ela

#group_by(tipoContrato) - agrupa os dados da coluna especificada do
#dataframe pelas categorias existentes na coluna

#n() -> A função 'n' conta o número de linhas em cada grupo

#x = ~tipoContrato e y = ~frequencia -> Procure uma coluna com o
#nome a seguir dentro do dataframe que foi fornecido 
#freq_contrato

#------------------------Barras - interativo--------------------
freq_contrato <- dados %>%
  group_by(tipoContrato) %>%
  summarise(frequencia = n())
plot_ly(freq_contrato, x = ~tipoContrato,
        y = ~frequencia, type = 'bar')

#No caso abaixo não se tem a coluna frequência
plot_ly(dados, x = ~tipoContrato)

#Cria uma tabela de frequência contando as ocorrências 
#de cada valor na coluna tipoContrato
table(dados$tipoContrato)

#-----------------------Barras tradicional--------------------
barplot(table(dados$tipoContrato))

#-----------------------Pizza - interativo--------------------
freq_regiao <- dados %>%
  group_by(regiao) %>%
  summarise(frequencia = n())
plot_ly(freq_regiao, labels =~regiao,
        values = ~frequencia, type = 'pie')
#-----------------------Pizza tradicional---------------------
table(dados$regiao)
pie(table(dados$regiao))
#-----------------------Dispersão - interativo----------------
plot_ly(dados, x=~idade, y=~salario,
        type='scatter', mode='markers')
#-----------------------Dispersão tradicional-----------------
#plot(dados$idade, dados$salario)
plot(dados$idade, dados$salario,
     main = "Relação entre idades e salários",
     col = "red",
     xlab = "Idade", ylab = "Salário")

#--------------------Histograma - interativo-------------------
plot_ly(dados, x = ~salario, type = 'histogram')

#--------------------Histograma tradicional--------------------
hist(dados$salario,
     main = "Distribuição de salários",
     xlab = "Salário (R$)", 
     ylab = "Frequência")
#--------------------BoxPlot - interativo----------------------
plot_ly(dados, y = ~salario, type = 'box', name = 'Salários')%>%
  layout(
    title = "Distribuição de salários na empresa",
    yaxis = list(title="Salário (em R$)")
  )
#Compara a distribuição da variável salario entre as 
#diferentes categorias de uma outra variável, a 
#satisfacaoEmpresa.
plot_ly(dados, x= ~satisfacaoEmpresa, 
        y = ~salario, type = 'box')
#Adicionando título e ajustando nome dos eixos
plot_ly(dados, x= ~satisfacaoEmpresa, 
        y = ~salario, type = 'box') %>% 
  layout(
    title = "Distribuição de Salários na Empresa x Satisfação",  
    yaxis = list(title = "Salário (em R$)"),
    xaxis = list(title = "Satisfação") 
  )


#---------------Boxplot - tradicional-------------------
boxplot(dados$salario,
        main = "Distribuição de Salários",
        ylab = "Salário (R$)")

boxplot(dados$salario ~dados$satisfacaoEmpresa,
        main = "Distribuição de Salários",
        xlab = "Satisfação",
        ylab = "Salário (R$)")

#Os comandos abaixo são usados em conjunto para criar
#um gráfico chamado Q-Q Plot

#O objetivo principal de um Q-Q Plot é verificar 
#visualmente se uma amostra de dados (salários) 
#segue uma determinada distribuição teórica. 


#--------------QQ-Plot - tradicional--------------------
# 1. Cria os pontos de comparação
qqnorm(dados$salario, 
       main = "Q-Q Plot para Salários") 

# 2. Adiciona a linha de referência ideal
qqline(dados$salario, col = "red", lwd = 2) 

#Pontos muito próximos da linha: É um forte indicativo 
#de que seus dados de salário são normalmente 
#distribuídos. 

#Pontos nas extremidades (início e fim) muito distantes 
#da linha: Geralmente indica a presença de outliers



#------------------------------------------------------
#                     EXERCÍCIO 01
#------------------------------------------------------
#Implemente um gráfico onde se tenha o número de 
#funcionários por região na distribuição existente

#----------------GRÁFICO DE BARRAS---------------------

freq_contrato <- dados %>%
  group_by(regiao) %>%
  summarise(frequencia = n())

plot_ly(freq_contrato, x = ~regiao, 
        y = ~frequencia, type = 'bar') %>%
  layout(
    title = "Distribuição de funcionários por região",  
    yaxis = list(title = "Nº de funcionários"),
    xaxis = list(title = "Regiões do Brasil")) 

#------------------------------------------------------
#                     EXERCÍCIO 02
#------------------------------------------------------
#Implemente um gráfico onde seja apresentada a porcentagem
#de homens e mulheres existentes na distribuição.

#----------------GRÁFICO DE PIZZA----------------------

freq_MF <- dados %>%
  group_by(sexo) %>%
  summarise(frequencia = n())

plot_ly(freq_MF, labels = ~sexo, 
        values = ~frequencia, type = 'pie') %>%
  layout(
    title = "Homens x Mulheres") 

#------------------------------------------------------
#                     EXERCÍCIO 03
#------------------------------------------------------
#Implemente um gráfico onde se seja apresentada o número
#de funcionários, separados por sexo, em cada região do
#Brasil e fora dele (Sul, Sudeste, Norte, Nordeste, 
#Centro-Oeste e exterior)

#----------------GRÁFICO DE BARRAS AGRUPADAS-----------

freq_regiao_sexo <- dados %>%
  group_by(regiao, sexo) %>%
  summarise(frequencia = n())

plot_ly(freq_regiao_sexo, x = ~regiao, 
        y = ~frequencia, type = 'bar', color = ~sexo) %>%
  layout(
    title = "Distribuição de funcionários por região e sexo",  
    yaxis = list(title = "Nº de funcionários"),
    xaxis = list(title = "Regiões do Brasil"),
    barmode = 'group') 

#------------------------------------------------------
#                     EXERCÍCIO 04
#------------------------------------------------------
#Implemente um gráfico onde se tenha a distribuição dos 
#salários por região
plot_ly(dados, x= ~regiao, 
        y = ~salario, type = 'box') %>% 
  layout(
    title = "Distribuição de Salários da Empresa por região",  
    yaxis = list(title = "Salário (em R$)"),
    xaxis = list(title = "Região")) 



