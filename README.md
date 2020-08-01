# Desafio-Programa-de-Onboarding

# API ranking de nomes IBGE

## Tópicos

&nbsp; [Descrição](#descrição)

&nbsp; [Gems instaladas](#gems-instaladas)

&nbsp; [Pré-Requisitos](#pré-requisitos)

&nbsp; [Configurações](#configurações)

&nbsp; [Como utilizar o app](#como-utilizar-o-app)

&nbsp; [Executando os testes](#executando-os-testes)

&nbsp; [Melhorias e Sugestões](#melhorias-e-sugestões)


## Descrição

<p align="justify">
 Essa aplicação foi desenvolvida com base no app <a href="https://censo2010.ibge.gov.br/nomes/#/search/response/235)">Nomes do Brasil</a>, em que é possível consultar as estatísticas de nomes registrados no Brasil tendo como parâmetro a localidade retornando um ranking geral ou de acordo com o sexo, ou a pesquisa por um nome e o número de registros conforme as décadas, a partir da decada de 1930 até 2010.

  Nesta aplicação desenvolvida é possível:

Listar os 20 nomes mais utilizados em cada estado em um ranking geral e por sexo.

Listar os 20 nome mais utilizados em um muncípio específico.

Listar a frequência de registro de um nome, entre as decadas de 1930 a 2010.
</p>

## Gems instaladas

&nbsp; [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes

&nbsp; [**Rubocop**](https://github.com/rubocop-hq/rubocop) como linter

&nbsp; [**Webmocker**](https://github.com/fazibear/colorize) para testes relacionados a requisções


## Pré-Requisitos:

Algumas dependencias devem ser instaladas antes de configurar o projeto:

&nbsp; [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.6

&nbsp; [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

&nbsp; [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

Para checar a versão, execute:
```
$ <nome da dependencia> -v
```
## Configurações:
para Windows

verificar o melhor meio de executar o Ruby em terminal disponível, sugestão: WSL ou outra máquina virtual

para sistemas Unix como Linux e MacOS

No terminal, clone este projeto:
```
$ git clone https://github.com/namae-no-nai/Desafio-Programa-de-Onboarding
```
Acesse a pasta no terminal :
```
$ cd Desafio-Programa-de-Onboarding
```
Instale as dependencias:
```
$ bin/setup
```
Para abrir o app:
```
$ ruby lib/app.rb
```

## Como utilizar o app:

Executando a ultima linha de código, o programa abrirá em seu terminal, e serão exibidas opções de 1 a 4, Sendo:

1 - A primeira para a consulta de nome por estado(UF), será listado todas as 27 UFs do brasil e seu respectivo código de consulta, ao inserir o código será listado o ranking geral, masculino e femino dos 20 nomes mais utilizados para o estado escolhido, se um número ou caractere não correspondente for inserido o programa é encerrado sem quebra, depois da listagem o programa retorna ao menu principal .

2 - Segunda para a consulta da lista de nomes por município deve-se inserir o nome do município com a primeira letra de cada nome em caixa alta, seguida de sua UF entre parênteses, como o exemplo demostrado no próprio terminal ex: São Paulo (SP), o programa irá então listar os 20 nomes mais utilizados no município selecionado em um ranking geral, masculino e feminino, valores inválidos fazem o programa encerrar sem quebra, depois da listagem o programa retorna ao menu principal .

3 - Terceira para a consulta por nomes, como descrito no terminal deve-se utilizar apenas nomes sem acento e para pesquisa de mais de um nome de uma vez é necessario separa-los por virgulas(,), a frequência é obtida pela grafia do nome, não são considerados nomes compostos, a listagem é feita quando há registros entre as decadas de 1930 e 2010, retornando nada se não há registros, inserção de caracteres inválidos, como acentos ou vazio farão com que o programa termine sem quebra, caso os nomes sejam listados o programa retorna pro menu incial

4 - Quarta termina o programa

## Executando os testes:

```ruby
$ <pasta da aplicação>
$ rspec
```

## Melhorias e sugestões

- Consulta de tabelas SQL em vez de arquivos CSV

- Exibir a porcentagem de regsitros em realação a populção da cidade ou do período

- Melhorar a interface para uso fora do terminal, com Rails ou gems como Sinatra que premitem o uso de HTML

- Refatoração do código para melhor performance ou para atendender necessidades mais específicas

- Guardar consultas feitas

- Aumentar a cobertura de testes
