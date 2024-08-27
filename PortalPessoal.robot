** Settings **
Library  SeleniumLibrary

** Variables **
#Variaveis
${Site} 

#Variáveis de configuração
${URL}  https://contactcenter6.aec.com.br/Portal_Pessoal/Acesso/Login?ReturnUrl=%2fPortal_Pessoal%2f
${Browser}  chrome

#Elementos
${input_login}           //input[@id="Matricula"]
${input_senha}           //input[@id="Senha"]
${button_entrar}         //*[@id="frmLogin"]/div[2]/button
${prova}                 //*[@id="navbar"]/ul[1]/li[6]/a
${prova_sem_senha}       //*[@id="frmLogin"]/div[2]/div[6]/div/ul/li
${prova_sem_login}       //*[@id="frmLogin"]/div[2]/div[6]/div/ul/li[1]

** Keywords **
Dado que eu quero logar no Portal Pessoal
    Open Browser    ${URL}  ${Browser}

Quando insiro meu login e senha
    Input Text      ${input_login}      rafael.coimbra
    Input Text      ${input_senha}      Senha1234

E clico no captcha e em entrar
    Sleep  10s  # Adiciona um delay para resolver o captcha manualmente
    Click Element    ${button_entrar}

Então conseguirei logar
    Element Should Be Visible    ${prova}

Quando insiro somente o login e não a senha
    Input Text      ${input_login}      rafael.coimbra

Então o site mostrará a mensagem de erro "Favor informar a senha"
    Element Should Be Visible   ${prova_sem_senha}

Quando não insiro o login e somente a senha
    Input Text      ${input_senha}      Senha1234

Então o site mostrará a mensagem de erro "Favor informar a Matricula/Login"
    Element Should Be Visible   ${prova_sem_login}

**Test Cases**
Cenário 1: Abrir o Portal Pessoal 
    Dado que eu quero logar no Portal Pessoal
    Quando insiro meu login e senha
    E clico no captcha e em entrar
    Então conseguirei logar

Cenário 2: Abrir e não inserir a senha
    Dado que eu quero logar no Portal Pessoal
    Quando insiro somente o login e não a senha
    E clico no captcha e em entrar
    Então o site mostrará a mensagem de erro "Favor informar a senha"

Cenário 3: Abrir e não inserir a Matricula
    Dado que eu quero logar no Portal Pessoal
    Quando não insiro o login e somente a senha
    E clico no captcha e em entrar
    Então o site mostrará a mensagem de erro "Favor informar a Matricula/Login"


