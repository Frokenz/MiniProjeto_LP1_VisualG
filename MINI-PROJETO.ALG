algoritmo "controle-clientes"
// Aluno: Erick Rodrigues
// Matéria de Linguagem de Programação 1
// Professor: Bruno Torres

// Exemplo do problema: trabalhei em uma lanhouse durante um ano, lá faziam
// conserto de computadores, porém era muito mal organizado
// os dados dos clientes eram anotados no papel de qualquer forma e as vezes
// perdiamos o papel pois era colado no gabinete com fita durex e desprendia.

// Solução: criar um algoritmo que possibilita a criação de um cadastro
// do cliente que deseja realizar um conserto/manutenção do dispositivo, com
// um limite de 10 clientes por fila, pois dependendo do serviço pode demorar
// muito tempo.

var

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
clients: inteiro


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
// clients: variavel para mostrar quantidade de usuarios cadastrados.


// caso 1
procedimento cad_client
inicio

// verificação de espaço vazio na fila de clientes, caso haja algum espaço
// a variavel n responsavel pelas posições nos vetores recebe o valor do
// contador.
para contador de 10 ate 1 passo -1 faca
   se (tel[contador]=0)entao
      n <- contador
   fimse
fimpara

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

   escreval()
   escreval("===== Cadastro Feito com Sucesso =====")
   
fimse

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
se(y=0)entao
   escreval("ID Inválido, aperte ENTER para voltar ao menu principal!")
   escreval()
senao
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
   escreval()
   escreval("================ !!!ATENÇÃO!!! ================")
   escreval("Se deseja voltar ao menu principal aperte ENTER")
   escreval("===============================================")
   escreval()
   leia(edit)
   escreval()
   limpatela
         se(edit=0)entao
         senao
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
            escreval("===== Dados Editados com Sucesso! =====")
            escreval("=== Aperte ENTER para voltar ao Menu ===")
            leia(enter)
         fimse
fimse

limpatela

fimprocedimento

//caso 3
procedimento client_list
inicio

se(QuantClientCad(clients)=0)entao
   escreval("===========================")
   escreval(" Nenhum Cliente Cadastrado ")
   escreval("===========================")
senao
   para contador de 1 ate 10 faca
      se (disp[contador] = "") ou (nomes[contador] = "") ou (tel[contador] = 0)entao
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
fimse

escreval()
escreval("=== Aperte ENTER para voltar ao Menu ===")
leia(enter)

limpatela


fimprocedimento

//caso 4
procedimento delet_client
inicio

escreval("Digite o ID do cliente: ")
leia(idclient)

se (idclient=0)entao
   enquanto idclient=0 faca
      escreval("Digite um ID válido: ")
      leia(idclient)
   fimenquanto
fimse

n <- idclient

// essa parte é para substituir os dados por dados "vazios".
para contador de idclient ate idclient faca
   tel[contador] <- 0
   nomes[contador] <- ""
   disp[contador] <- ""
fimpara

para contador de idclient ate 10 faca
   tel[contador] <- tel[contador+1]
   nomes[contador] <- nomes[contador+1]
   disp[contador] <- disp[contador+1]
fimpara

escreval("===== Cadastro Deletado com Sucesso =====")
escreval("==== Aperte ENTER para voltar ao Menu ====")
leia(enter)
limpatela

fimprocedimento

//caso 5
procedimento reset_client
inicio

para contador de 1 ate 10 faca
   tel[contador] <- 0
   nomes[contador] <- ""
   disp[contador] <- ""
   n <- 1
fimpara

escreval("===== Cadastros Resetados com Sucesso =====")
escreval("==== Aperte ENTER para voltar ao Menu ====")
leia(enter)
limpatela

fimprocedimento
//

funcao QuantClientCad(clients: inteiro):inteiro

inicio

   para contador de 1 ate 10 faca
      se(tel[contador]>0)entao
        clients <- contador
      fimse
   fimpara

retorne clients

fimfuncao


inicio

// declaração de valores para algumas variaveis que irei utilizar como
// se fosse "contadores".

n <- 1
z <- 2

// estrutura de repita para sempre voltar o menu após o escolha.

repita
   escreval("Número de clientes cadastrados: ",QuantClientCad(clients))
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

   delet_client

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

escreval("# Programa Encerrado #")

fimalgoritmo