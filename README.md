# README

Projeto Solução Teste do Marketplace.



## DEMO

Para acessar basta criar um usuário e logar.

https://marketplacedataplaxe.herokuapp.com/

## Funcionalidaes
O sistema fornece as seguintes funcionalidades:
* Criação, listagem, alteração e remoção de um relatório.
* Criação, lisagem, alteração e remoção de uma KPI.
* Criação, lisagem, alteração e remoção de uma Etiqueta (label).
* Dasbhoard que lista todos os relatórios criados e possibilita
ao usuário a aquisição e revogação de um relatório.

## Modelo de Dados

###Entidades
* Relatório
* Usuário (Cliente)
* KPI
* Etiqueta (Label)

##Relacionamentos
* Usuário(M) x (N)Relatório
* Relatório(M) x (N)KPI
* Relatório(M) x (N)Etiqueta

##Dependências utilizadas

#####Armazenamento Arquivos
* Active Record

#####Autenticação 
Devise

#####FRONT-END
* bootstrap: estilos
* font-awesome-rails: ícones e fontes

#####TESTES
* Rspec: Criação de teste
* Cucumber: Criação de teste (Solicitado pelo Projeto)
* Factory Bot: Mock 
* Faker: Gerar dados falsos
* Coverage: Cobertura de código 

#####SGBD
* PG (PostgresSQL): versão de produção
* SQLite: versão desenvolvimento e teste 