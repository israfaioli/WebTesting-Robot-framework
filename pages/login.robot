*** Settings ***
Library     SeleniumLibrary

*** Variable ***
${URL}  http://automationpractice.com/index.php?controller=authentication&back=my-account
${EMAIL_INPUT}                id=email
${PASSWORD_INPUT}             id=passwd
${SIGIN_BUTTON}               id=SubmitLogin
${USER_NAME_LABEL}            css=#header > div.nav > div > div > nav > div:nth-child(1) > a > span
${MY_ACCOUNT_BREADCRUMB}      css=#columns > div.breadcrumb.clearfix > span.navigation_page
${MY_ACCOUNT_TITLE}           Login - My Store
${EXPECTION_LOGIN_MESSAGE}    css=#center_column > div.alert.alert-danger > ol > li

*** Keywords ***
###actions ###
Acessar a página login aplicação
    Go To        ${URL}
    Title Should Be     ${MY_ACCOUNT_TITLE}

Realizar login
  [Arguments]   ${EMAIL}  ${PASSWORD}
  Wait Until Element Is Visible     ${EMAIL_INPUT}
  Input Text    ${EMAIL_INPUT}    ${EMAIL}
  Wait Until Element Is Visible     ${PASSWORD_INPUT}
  Input Text    ${PASSWORD_INPUT}   ${PASSWORD}
  Click Button    ${SIGIN_BUTTON}

###asserts ###
Verificar se nome do usuário logado está correto
  [Arguments]   ${EXPECTED_USER_NAME}
  Wait Until Element Is Visible     ${USER_NAME_LABEL}
  ${ACTUAL_USER_NAME}   Get Text    ${USER_NAME_LABEL}
  Should Be Equal As Strings      ${EXPECTED_USER_NAME}     ${ACTUAL_USER_NAME}

Verificar se usuário está localizado e tela de my account
    [Arguments]   ${EXPECTED_LABEL}
    Wait Until Element Is Visible     ${MY_ACCOUNT_BREADCRUMB}
    ${ACTUAL_BREADCRUMB_LABEL}    Get Text    ${MY_ACCOUNT_BREADCRUMB}
    Should Be Equal As Strings      ${EXPECTED_LABEL}     ${ACTUAL_BREADCRUMB_LABEL}

Verificar mensagem de exceção
    [Arguments]     ${EXPECTED_MESSAGE}
    Wait Until Element Is Visible     ${EXPECTION_LOGIN_MESSAGE}
    ${ACTUAL_EXCEPTION_MESSAGE}     Get Text   ${EXPECTION_LOGIN_MESSAGE}
    Should Be Equal As Strings      ${EXPECTED_MESSAGE}     ${ACTUAL_EXCEPTION_MESSAGE}
