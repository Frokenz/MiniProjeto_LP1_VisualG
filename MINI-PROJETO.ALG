algoritmo "controle-clientes"
// Aluno: Erick Rodrigues
// Mat�ria de Linguagem de Programa��o 1
// Professor: Bruno Torres

// Exemplo do problema: trabalhei em uma lanhouse durante um ano, l� faziam
// conserto de computadores, por�m era muito mal organizado
// os dados dos clientes eram anotados no papel de qualquer forma e as vezes
// perdiamos o papel pois era colado no gabinete com fita durex e desprendia.

// Solu��o: criar um algoritmo que possibilita a cria��o de um cadastro
// do cliente que deseja realizar um conserto/manuten��o do dispositivo, com
// um limite de 10 clientes por fila, pois dependendo do servi�o pode demorar
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
// tel: variavel que representa os n�meros de contato dos clientes.
// disp: variavel que representa os despositivos deixados na loja.
// contador: basicamente o contador principal.
// n: para servir como um "contador".
// x: define qual op��o do menu seguir.
// y: para receber valor de client para edit.
// z: para servir como um "contador".
// idclient: identificador de cada posi��o na fila de atendimento.
// enter: variavel para o usuario apertar o enter e retornar ao menu principal.
// edit: variavel que recebe valor para edit de infos.
// clients: variavel para mostrar quantidade de usuarios cadastrados.


// caso 1
procedimento cad_client
inicio

// verifica��o de espa�o vazio na fila de clientes, caso haja algum espa�o
// a variavel n responsavel pelas posi��es nos vetores recebe o valor do
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
   escreval("Digite o n�mero do cliente: ")
   leia(tel[n])

   enquanto (tel[n]= 0) faca
      escreval("Digite um n�mero de telefone v�lido: ")
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
   escreval("ID Inv�lido, aperte ENTER para voltar ao menu principal!")
   escreval()
senao
   limpatela
   para contador de y ate y faca
      escreval("========================================")
      escreval("Dados Atuais do cliente selecionado ")
      escreval("ID Cliente:", y)
      escreval("Nome do cliente atual: ",nomes[contador])
      escreval("N�mero de Telefone: ", tel[contador])
      escreval("Dispositivo: ", disp[contador])
      escreval("========================================")
   fimpara

   escreval()

   escreval("Qual dado voc� deseja editar?")
   escreval(" 1 - Nome do cliente: " )
   escreval(" 2 - N�mero de Telefone: ")
   escreval(" 3 - Dispositivo: ")
   escreval()
   escreval("================ !!!ATEN��O!!! ================")
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
            escreval("Digite o novo n�mero de telefone: ")
            leia(tel[y])
            caso 3
            escreval("Digite a nova descri��o do dispositivo: ")
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
         escreval("N�mero de Telefone: ", tel[contador])
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
      escreval("Digite um ID v�lido: ")
      leia(idclient)
   fimenquanto
fimse

n <- idclient

// essa parte � para substituir os dados por dados "vazios".
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

// declara��o de valores para algumas variaveis que irei utilizar como
// se fosse "contadores".

n <- 1
z <- 2

// estrutura de repita para sempre voltar o menu ap�s o escolha.

repita
   escreval("N�mero de clientes cadastrados: ",QuantClientCad(clients))
   escreval()
   escreval("=====================")
   escreval(" MENU DO FUNCION�RIO ")
   escreval("=====================")
   escreval()
   escreval("1 - CADASTRO DE CLIENTE")
   escreval("2 - EDITAR CADASTRO")
   escreval("3 - LISTA DE CLIENTES")
   escreval("4 - APAGAR CLIENTES")
   escreval("5 - RESETAR LISTA DE CLIENTES")
   escreval("6 - ENCERRAR PROGRAMA")
   escreval()
   escreval("Digite um valor correspondente a fun��o desejada: ")
   leia(x)
   limpatela


   escolha x

   caso 1
   // O caso 1 tem a fun��o de cadastrar o cliente.

   cad_client

   caso 2
   // O caso 2 tem como fun��o de editar informa��es j� depositadas no sistema.
   edit_client

   caso 3
   // O caso 3 tem como fun��o disponibilizar a lista de clientes j� cadastrados
   // como suas informa��es necess�rias para o atendimento e contato.

   client_list

   caso 4
   // O caso 4 tem como fun��o de sobrepor os dados de um cliente j� cadastrado
   // por dados vazios/sem valores, dando a ilus�o de "deletar" os dados.

   delet_client

   caso 5
   // O caso 5 � a op��o que eu coloquei parar resetar o programa sem precisar
   // encerra-lo.

   reset_client

   outrocaso
   // Caso o usu�rio digite um n�mero diferente de 1..6 ent�o ser� impresso
   // para ele digitar um n�mero v�lido dentre as op��es dispon�veis.

      se (x=6)entao
         escreva(" ")
      senao
         escreval("==============================================")
         escreval("Digite um n�mero v�lido ou encerre o programa!")
         escreval("==============================================")
      fimse
   fimescolha

ate (x = 6)

escreval("# Programa Encerrado #")

fimalgoritmo