*** Settings ***
Resource    ../resources/common.robot
Resource    ../pages/login.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Variables ***
&{USER_CREDENTIALS}     email=automation1@teste.com     senha=12345   userName=automation test

*** Test Case ***
CT01: Login válido na aplicação
    Dado que estou na aplicação
    Quando informado credenciais válidas e confirmado acesso
    Então devo ser direcionado para tela de my account

CT02: Validar exceções de login
  [Template]    Combinações de logins
  #email                    #password     #message
  automation1@teste.com     123456        Authentication failed.
  automation2@teste.com     12345         Authentication failed.
  ${EMPTY}                  12345         An email address required.
  automation1@teste.com     ${EMPTY}      Password is required.

*** Keywords ***
###Dado ###
Dado que estou na aplicação
  Acessar a página login aplicação

###Quando ###
Quando informado credenciais válidas e confirmado acesso
    Realizar login    ${USER_CREDENTIALS.email}    ${USER_CREDENTIALS.senha}

Quando preencher o campo email ${EMAIL} e ${PASSWORD} para confirmar login
    Realizar login    ${EMAIL}    ${PASSWORD}

###Então ###
Então devo ser direcionado para tela de my account
  Verificar se nome do usuário logado está correto    ${USER_CREDENTIALS.userName}
  Verificar se usuário está localizado e tela de my account    My account

Então uma mensagem ${MESSAGE} de exceção deve ser exibida
  Verificar mensagem de exceção    ${MESSAGE}

###Test template ###
Combinações de logins
    [Arguments]     ${EMAIL}    ${PASSWORD}   ${MESSAGE}
    Dado que estou na aplicação
    Quando preencher o campo email ${EMAIL} e ${PASSWORD} para confirmar login
    Então uma mensagem ${MESSAGE} de exceção deve ser exibida
