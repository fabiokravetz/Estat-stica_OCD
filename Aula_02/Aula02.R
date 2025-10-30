#round(x) - Arredonda para o inteiro mais próximo
#ceiling(x) - Arredonda sempre para cima
#floor(x) - Arredonda sempre para baixo
#trunc(x) - Remove a parte decimal

#-----------------------------------------------------------------
#Considere o vetor de salários abaixo:
salarios <- c(1518, 1800, 2100, 2150, 1518, 3300, 5450, 1250,
              2538, 2250, 3750, 4000, 4200, 3500, 3000)

#MÉDIA
calc_media <- mean(salarios)
print(paste("O valor da média de salários é ", 
            round(calc_media, 2), "."))

#MEDIANA
calc_mediana <- median(salarios)
print(paste("O valor da mediana dos salários é ", 
            round(calc_mediana, 2), "."))

#MODA
tabela_freq <- table(salarios)
print("Contagem de cada salário (Tabela de Frequência):")
print(tabela_freq)

#A função names() extrai os nomes (salários) de um objeto.
#Aplicada a nota tabela_frequencia, ela retorna um vetor de texto
#com os nomes de todos os salários em ordem crescente
print(names(tabela_freq))

#A função which.max() ela não retorna o valor máximo, mas sim a posição
# ou índice do valor máximo
print(which.max(tabela_freq))

moda_avaliacoes_salario <- names(tabela_freq)[which.max(tabela_freq)]
print(moda_avaliacoes_salario)

moda_avaliacoes <- as.numeric(moda_avaliacoes_salario)
print(paste("A moda dos salários foi de: ", moda_avaliacoes))

#---------------------Aula 21/08/2025------------------------

#Função runif(n, min, max)
salario1200 <- round(runif(1200, 1518, 2200))
print(salario1200)

tab_frequencia_salario1200 <- table(salario1200)
print(tab_frequencia_salario1200)

moda_salario1200 <- names(tab_frequencia_salario1200)[which.max(tab_frequencia_salario1200)]
print(moda_salario1200)

moda_avaliacoes1200 <- as.numeric(moda_salario1200)

print(paste("A moda dos salários foi de ", moda_avaliacoes1200, 
            "Esse salário se repete", max(tab_frequencia_salario1200), " vezes"))

#-----------------------EXERCÍCIO 01----------------------------
tempo_ms <- c(2, 61, 59, 68, 75 ,53, 62, 1135, 71, 
              65, 58, 64, 56, 60, 68)
print(tempo_ms)

#Passo adicional
valores_ordenados <- sort(tempo_ms)
print(valores_ordenados)

valor_mediana <- median(tempo_ms)
print(paste("O valor da mediana é ", valor_mediana))

valor_media <- mean(tempo_ms)
print(paste("O valor da média é ", round(valor_media, 2)))

#-----------------------EXERCÍCIO 02---------------------------
tipos_lanches <- c('x-salada', 'cachorro quente', 
                   'risoles', 'pastel', 
                   'sanduíches naturais', 'pastel',
                   'x-salada', 'pastel', 'risoles',
                   'pastel', 'x-salada', 'cachorro quente',
                   'pastel')
print(tipos_lanches)

tabela_frequencia <- table(tipos_lanches)
print("Tabela de Frequência de lanches:")
print(tabela_frequencia)

moda_lanches <- names(tabela_frequencia)[which.max(tabela_frequencia)]
print(paste("Moda (categoria de lanche + pedido):", moda_lanches))

#Quantidade de repetições
print(paste("A qtde de repetições foi de:", 
            max(tabela_frequencia), " vezes"))

mediaa <- mean(tipos_lanches)

#-------------------------------EXERCÍCIO 03---------------------------
# Vetor com as 20 avaliações recentes do hotel
avaliacoes_recentes <- c(5, 5, 4, 5, 3, 4, 5, 1, 4, 5, 
                         5, 4, 3, 5, 2, 4, 5, 5, 4, 5)

# 2. CÁLCULO DA MÉDIA
# A média nos dá a "nota geral" da amostra.
media_avaliacoes <- mean(round(avaliacoes_recentes,2))
print(paste("A média das avaliações recentes foi de:", 
            media_avaliacoes))

# 3. CÁLCULO DA MEDIANA
# A mediana é o valor central que divide o conjunto de dados em duas metades.
# Com 20 dados, será a média entre o 10º e o 11º valor após a ordenação.
mediana_avaliacoes <- median(avaliacoes_recentes)
print(paste("A mediana das avaliações recentes foi de:",
            mediana_avaliacoes))


# 4. CÁLCULO DA MODA
# A moda é a nota que apareceu com mais frequência na amostra.

# a) Criar uma tabela de frequência para contar cada nota
tabela_freq <- table(avaliacoes_recentes)
print("Contagem de cada nota (Tabela de Frequência):")
print(tabela_freq)

# b) Encontrar o nome da coluna (a nota) com a maior contagem
moda_avaliacoes_texto <- names(tabela_freq)[which.max(tabela_freq)]
#O valor abaixo é um texto, por isso a transformação em numeric
print(moda_avaliacoes_texto)

# c) Converter o resultado para numérico
moda_avaliacoes <- as.numeric(moda_avaliacoes_texto)
print(moda_avaliacoes)

print(paste("A moda das avaliações recentes foi de:", 
            moda_avaliacoes))

#Quantidade de repetições
print(paste("A qtde de repetições foi de:", 
            max(tabela_freq), " vezes"))

#-------------------------------EXERCÍCIO 04---------------------------
downloads_loja_a <- c(150, 165, 172, 150, 155, 180, 190)
downloads_loja_b <- c(140, 145, 150, 148, 160, 155, 152)

media_loja_a <- mean(downloads_loja_a, na.rm = TRUE)
print(paste("Média de downloads (Loja A):", round(media_loja_a, 2)))

# 3. Calcular a mediana da Loja B
mediana_loja_b <- median(downloads_loja_b)
print(paste("Mediana de downloads (Loja B):", mediana_loja_b))

#----------------------------MÉDIA APARADA---------------------------
#Também chamada de média truncada. Como o nome sugere, ela consiste
#em "aparar" ou remover uma certa porcentagem dos valores mais baixos
#e mais altos de um conjunto de dados.

#Ao descartar os extremos, a média aparada se torna menos suscetível
#à influência de outliers (valores extremos) em ambas as pontas da
#distribuição

#Como calcular a média aparada
#Ordenar os dados do menor para o maior

#Determine a porcentagem de dados a ser aparada em cada extremidade
#(por exemplo, 10%)

#Remova essa porcentagem de observações tanto do início quanto do fim
#do vetor

#Calcule a média dos valores restantes

salarios <- c(2000, 2200, 2350, 2700, 2900, 15000)
media_salarios <- mean(round(salarios, 2))
print(paste("A média dos salários é R$ ", media_salarios))

mediana_salarios <- median(salarios)
print(paste("A mediana dos salários é R$ ", mediana_salarios))

#-----------------------Cálculo da média aparada---------------------
media_aparada <- mean(salarios, trim = 0.3)
print(paste("A média aparada dos salários é R$ ", media_aparada))

#-----------------------------------------------------------------
#------------------------Aula 28/08/2025--------------------------
#-----------------------------------------------------------------
notas <- c(8, 7.2, 5, 2, 9)

#MÉDIA
valor_media <- mean(notas)
print(paste("O valor da média é ", valor_media))

#VARIÂNCIA
valor_variancia <- var(notas)
print(paste("O valor da variância é ", valor_variancia))

#DESVIO PADRÃO
valor_desvioPadrao <- sd(notas)
print(paste("O valor do desvio padrão é ", round(valor_desvioPadrao, 2)))

#AMPLITUDE - MÉTODO 01
valor_amplitude <- max(notas) - min(notas)
print(paste("O valor da amplitude é ", valor_amplitude))

#AMPLITUDE - MÉTODO 02
#range(x): 
print(range(notas))

amplitude_diferenca <- diff(range(notas))
print(paste("O valor da amplitude é ", amplitude_diferenca))

#--------------------------Cálculos - Planilha EXCEL-------------------------
install.packages('readxl')
library(readxl)

file.choose()

#Cria uma variável para guardar a rota do arquivo excel
rota_planilha <-"C:\\Users\\fabio\\OneDrive\\Área de Trabalho\\Curso estatística - Linguagem R\\Aula 02\\idades.xlsx"

#O comando abaixo vai apresentar o nome das abas da planilha
excel_sheets(rota_planilha)

#Definição de qual planilha vai se trabalhar
p1 <- read_excel(rota_planilha)
head(p1)

#Utilizado caso tivesse mais uma aba
#p2 <- read_excel(rota_planilha, sheet = nome_aba)

#Calculo da média
media <- mean(p1$idade)
print(paste("A média de idade é igual a ", round(media, 2)))

#Calculo da mediana
mediana <- median(p1$idade)
print(paste("A mediana de idade é igual a ", mediana))

install.packages('modeest')
library(modeest)

moda <- mlv(p1$idade, method = "mfv")
moda
cat(moda)
print(paste("A moda das idades é igual a ", moda))
str(moda)

#Pegando quantas vezes a idade mais frequente (moda)
#aparece na tabela
tabela_frequencia <- table(p1$idade)
print("Frequência de cada idade:")
print(tabela_frequencia)

freq_moda <- tabela_frequencia[as.character(moda)]
print(paste("Essa idade aparece ", freq_moda, "vezes"))

# Amplitude
amplitude <- max(p1$idade) - min(p1$idade)
print(paste("A amplitue das idades é ", amplitude))

#Variância
varianciaIdades <- var(p1$idade)
print(paste("A variância das idades é ", 
            round(varianciaIdades,2)))

# Desvio padrão: O desvio padrão é uma medida de dispersão que indica 
#o quão espalhadas as idades estão em relação à média.
desvioPadraoIdades <- sd(p1$idade)
print(paste("O desvio padrão das idades é ", 
            round(desvioPadraoIdades,2)))

#--------------------------------------------------------------------------
                      #Cálculos - Turma A e/ou Turma B
#--------------------------------------------------------------------------
#subset(p1, turma == 'A'): Este comando cria um novo data frame
#que contém os dados somente da turma A, o mesmo processo é feito
#para a turma B.
turmaA <- subset(p1, turma == 'A')
print(turmaA)

turmaB <- subset(p1, turma == 'B')
print(turmaB)

#A condição é trazer os dados onde a coluna idade seja maior que 20

mais_velhos <- subset(p1, idade > 20)
print(mais_velhos)

#A condição é trazer os dados onde os alunos sejam da turma B e que
#tenham 19 anos

turmaB_19_anos <- subset(p1, turma == 'B' & idade == 19)
print(turmaB_19_anos)

#A condição é trazer os alunos que tenham menos de 19 anos OU
#mais de 30 anos

extremos_idade <- subset(p1, idade < 19 | idade > 30)
print(extremos_idade)

#A condição é trazer os alunos da turma A que tenham mais de 20
#anos e menor igual a 30 anos
idade_int <- subset(p1, turma == 'A' & (idade > 20 & idade <= 30))
print(idade_int)

#Calcule a moda, amplitude, variância e desvio padrão das 
#turmas A e B.

moda <- mlv(turmaA$idade, method = "mfv")
print(paste("A moda das idades é ", moda))
cat(moda)

# Amplitude
amplitude <- max(turmaA$idade) - min(turmaA$idade)
print(paste("A amplitue das idades é ", amplitude))

#Variância
varianciaIdades <- var(turmaA$idade)
print(paste("A variância das idades é ", round(varianciaIdades,2)))

# Desvio padrão
desvioPadraoIdades <- sd(turmaA$idade)
print(paste("O desvio padrão das idades é ", round(desvioPadraoIdades,2)))

#-----------------------------Turma B--------------------------------
moda <- mlv(turmaB$idade, method = "mfv")
print(paste("A moda das idades é ", moda))

# Amplitude
amplitude <- max(turmaB$idade) - min(turmaB$idade)
print(paste("A amplitue das idades é ", amplitude))

#Variância
varianciaIdades <- var(turmaB$idade)
print(paste("A variância das idades é ", round(varianciaIdades,2)))

# Desvio padrão
desvioPadraoIdades <- sd(turmaB$idade)
print(paste("O desvio padrão das idades é ", round(desvioPadraoIdades,2)))








































