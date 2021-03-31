### Projeto de automação - Web ###

Olá Analistas e recrutadores,

Espero que vocês consigam navegar com tranquilidade por esse projeto. Estou seguindo o padrão POM para estruturação do projeto.

É um projeto simples porém funcional onde procuro passar a vocês como utilizo o robot framework para as automações WEB.

Espero que gostem, qualquer dúvida fiquem a vontade para entrar em contato - israfaioli@gmail.com

### Pré-requesitos ###

* Python

* Robot framework

* Libraries

* IDE para desenvolvimento de sua automação

### Tecnologias Utilizadas ###
* Python
* Docker
* Selenium

### Setup necessário ###


* Instalar o python 4.0.

  ```
  acessar https://www.python.org/downloads/
  clicar no botão de download na versão apresentada
  realizar instalação
  ```

* Instalar o Robot framework versão 4.0.

  ```
  pip install robotframework==4.0
  ```

* Instalar o ATOM como IDE de desenvolvimento da sua automação(sugestão).

  ```
  acessar https://atom.io/
  clicar no botão de download na versão apresentada
  realizar instalação
  ```


* Instalar a library do Selenium.

  ```
  pip install --upgrade robotframework-seleniumlibrary
  ```


### Estrutura do projeto ###

* resources - Classes onde terão métodos em comum que poderão ser usadas por outras classes.
* pages - Onde será mapeado os elementos e funções de cada página seguindo a boa prática PO.
* result - Onde são armazenados os resultados dos nossos testes, evidências.
* tests - Suite principal para execução dos testes (Funcionais).

### Rodando o projeto ###

Em alguns casos, a depender de suas configurações locais, pode ser necessário executar o projeto com permissões de administrador adicionando "sudo" antes dos comandos abaixo.

* Acessa a pasta do projeto
* Rode o seguinte comando do maven:
```

## Execução dos Testes Funcionais ##

- O projeto executa com chrome, não headless, por default:

* Especificar o diretório dos results da execução:

```
 robot -d ./result tests
```

* Executar apenas um teste específico da suíte:

```
robot -d .\result -t "CT02: Validar exceções de login" tests
```

* Dando um nome à execução (para efeito de Log/Report):

```
 robot -N “Nome de Exemplo” -d ,\result tests
```

* Executando por TAGS:

```
 robot -d ./MeusResultados -i login tests
 ```

* Atribuindo valores a variáveis:

```
robot -d .\result -v BROWSER:chrome tests
 ```

* Executando teste em modo headless:

```
robot -d .\result -v BROWSER:headlesschrome -t "CT02: Validar exceções de login" tests


* -t é o parâmetro que indica que deve ser executado o(s) teste(s) específico(s) chamado(s). OBS.: Se existirem testes em diferentes suítes, mas com esse mesmo nome, todos serão executados.
* -N é o parâmetro que indica que a execução receberá um identificador (“Nome de Exemplo”). OBS.: Deve vir antes do -d.
* -i é o parâmetro que indica que devem ser executados apenas os testes cuja a Tag seja (smoketest).
* -v é o parâmetro que indica que será atribuído o valor (chrome) à variável (${BROWSER}) do meu teste.
