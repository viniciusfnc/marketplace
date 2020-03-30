#language: pt

Funcionalidade:

  COMO um usuário EU QUERO acessar o menu de Relatórios
  A FIM de criar um novo Relatório

  Contexto:
    Dado que eu esteja logado no sistema

  Cenário: Criar Relatório
    E clico no menu Relatórios
    Quando clico no link Adicionar Novo Relatório
    E preencho o campo Nome
    E preencho o campo Resumo
    E preencho o campo Período
    E preencho o campo Região
    E preencho o campo Preço Base
    E preencho o campo Descrição
    E clico no botão Criar Relatório
    Então eu vejos a mensagem Relatório criado com sucesso