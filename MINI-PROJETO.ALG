algoritmo "controle-clientes"
// Aluno: Erick Rodrigues
// Matéria de Linguagem de Programação 1
// Professor: Bruno Torres

// Exemplo do problema: trabalhei em uma lanhouse durante um ano, lá faziam
// conserto de computadores, porém era muito mal organizado
// os dados dos clientes eram anotados no papel de qualquer forma.

// Solução: criar um algoritmo que possibilita a criação de um cadastro
// do cliente que deseja realizar um conserto/manutenção do dispositivo, com
// um limite de 10 clientes por fila, pois dependendo do serviço pode demorar
// muito tempo.

var

// Sobre os vetores serem até o 11 é porque a posição 11 sempre estará vazia
// e quando eu fiz o caso 4 na opção de apagar um cliente da fila, a fila
// sempre andar e o vetor 10 receber o valor vazio do vetor 11.

nomes: vetor [1..11] de caractere
tel: vetor [1..11] de inteiro
disp: vetor [1..11] de caractere
contador: inteiro
contador2: inteiro
n: inteiro
x: inteiro
y: inteiro
z: inteiro
idclient: inteiro
enter: caractere
edit: inteiro

// nomes: variavel que representa os nomes dos clientes.
// tel: variavel que representa os números de contato dos clientes.
// disp: variavel que representa os despositivos deixados na loja.
// contador: basicamente o contador principal.
// n: para servir como um "contador".
// x: define qual opção do menu seguir.
// y: para receber valor de client para edit.
// z: para servir como um "contador".
// idclient: identificador de cada posição na fila de atendimento.
// enter: variavel para o usuario apertar o enter e retornar ao menu principal.
// edit: variavel que recebe valor para edit de infos.


// caso 1
procedimento cad_client
inicio
se (n > 10)entao
 escreval("Limite de clientes cadastrados atingido!")

   senao
   escreval("Digite o nome do cliente: ")
   leia(nomes[n])
   escreval("Digite o número do cliente: ")
   leia(tel[n])

   enquanto (tel[n]= 0) faca
   escreval("Digite um número de telefone válido: ")
   leia(tel[n])
   fimenquanto

   escreval("Digite o dispositivo do cliente: ")
   leia(disp[n])
   n <- n+1
fimse


escreval()
escreval("===== Cadastro Feito com Sucesso =====")
escreval("=== Aperte ENTER para voltar ao Menu ===")
leia(enter)
escreval()
limpatela

fimprocedimento

//caso 2
procedimento edit_client
inicio

escreval("Digite o ID do cliente que deseja editar: ")
leia(y)
escreval()
limpatela

para contador de y ate y faca
escreval("========================================")
escreval("Dados Atuais do cliente selecionado ")
escreval("ID Cliente:", y)
escreval("Nome do cliente atual: ",nomes[contador])
escreval("Número de Telefone: ", tel[contador])
escreval("Dispositivo: ", disp[contador])
escreval("========================================")
fimpara

escreval()

escreval("Qual dado você deseja editar?")
escreval(" 1 - Nome do cliente: " )
escreval(" 2 - Número de Telefone: ")
escreval(" 3 - Dispositivo: ")
leia(edit)
escreval()
escreval("Se deseja voltar ao menu principal aperte ENTER")
limpatela
escolha edit

caso 1
escreval("Digite o novo nome do cliente: ")
leia(nomes[y])
caso 2
escreval("Digite o novo número de telefone: ")
leia(tel[y])
caso 3
escreval("Digite a nova descrição do dispositivo: ")
leia(disp[y])
fimescolha

escreval()
escreval("===== Dados Editados com Sucesso! =====")
escreval("=== Aperte ENTER para voltar ao Menu ===")
leia(enter)
limpatela

fimprocedimento

//caso 3
procedimento client_list
inicio

para contador2 de 1 ate 1 faca
se(disp[contador2] = " ") ou (nomes[contador2] = " ")ou(tel[contador2] = 0)entao
escreval("===========================")
escreval(" Nenhum Cliente Cadastrado ")
escreval("===========================")
fimse
fimpara

para contador de 1 ate 10 faca
se (disp[contador] = " ") ou (nomes[contador] = " ") ou (tel[contador] = 0)entao
escreva("")

senao
escreval("ID Cliente: ", contador)
escreval("Cliente: ", nomes[contador])
escreval("Número de Telefone: ", tel[contador])
escreval("Dispositivo: ", disp[contador])
escreval()
escreval("------------------------------")

fimse
fimpara
escreval()
escreval("=== Aperte ENTER para voltar ao Menu ===")
leia(enter)
escreval()
limpatela


fimprocedimento

//caso 4
procedimento delet_client
inicio



fimprocedimento

//caso 5
procedimento reset_client
inicio

para contador de 1 ate 10 faca
tel[contador] <- 0
nomes[contador] <- " "
disp[contador] <- " "
n <- 1
fimpara

escreval("===== Cadastros Resetados com Sucesso =====")
escreval("==== Aperte ENTER para voltar ao Menu ====")
leia(enter)
limpatela

fimprocedimento
//

inicio

// declaração de valores para algumas variaveis que irei utilizar como
// se fosse "contadores".

n <- 1
z <- 2

// estrutura de repita para sempre voltar o menu após o escolha.

repita
escreval()
escreval("=====================")
escreval(" MENU DO FUNCIONÁRIO ")
escreval("=====================")
escreval()
escreval("1 - CADASTRO DE CLIENTE")
escreval("2 - EDITAR CADASTRO")
escreval("3 - LISTA DE CLIENTES")
escreval("4 - APAGAR CLIENTES")
escreval("5 - RESETAR LISTA DE CLIENTES")
escreval("6 - ENCERRAR PROGRAMA")
escreval()
escreval("Digite um valor correspondente a função desejada: ")
leia(x)
limpatela


escolha x

caso 1
// O caso 1 tem a função de cadastrar o cliente.

cad_client

caso 2
// O caso 2 tem como função de editar informações já depositadas no sistema.
edit_client

caso 3
// O caso 3 tem como função disponibilizar a lista de clientes já cadastrados
// como suas informações necessárias para o atendimento e contato.

client_list

caso 4
// O caso 4 tem como função de sobrepor os dados de um cliente já cadastrado
// por dados vazios/sem valores, dando a ilusão de "deletar" os dados.
escreval("Digite o ID do cliente: ")
leia(idclient)
se (idclient=0)entao
escreval("Digite um ID válido: ")
leia(idclient)
fimse
n <- idclient

// essa parte é para substituir os dados por dados "vazios".
para contador de idclient ate idclient faca
tel[contador] <- 0
nomes[contador] <- " "
disp[contador] <- " "
fimpara

// essa parte é para zerar o z para que eu possa substituir dados mais de uma
// vez sem precisar fechar o programa e sem dar erro.
se (z>11)entao
z <- 1
fimse

// essa parte é para substituir os dados pelo próximo.
// ainda está incompleto.
para contador de 1 ate 10 faca
  se (idclient = 1) entao
  nomes[contador] <- nomes[z]
  tel[contador] <- tel[z]
  disp[contador] <- disp[z]
  z <- z + 1

// essa parte aqui em baixo é de teste tentando finalizar.
//  senao
//    para contador2 de idclient ate 10 faca
 //   z <- contador2+1
 //   nomes[contador2] <- nomes[z]
 //   tel[contador2] <- tel[z]
 //   disp[contador2] <- disp[z]
 //   fimpara
  fimse
fimpara

caso 5
// O caso 5 é a opção que eu coloquei parar resetar o programa sem precisar
// encerra-lo.

reset_client

outrocaso
// Caso o usuário digite um número diferente de 1..6 então será impresso
// para ele digitar um número válido dentre as opções disponíveis.

se (x=6)entao
escreva(" ")
senao
escreval("==============================================")
escreval("Digite um número válido ou encerre o programa!")
escreval("==============================================")
fimse
fimescolha
ate (x = 6)
escreval("# Obrigado pela preferencia")
fimalgoritmo