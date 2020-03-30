# frozen_string_literal: true

require 'faker'

Quando('clico no link Adicionar Novo Relatório') do
  find("a[href='/reports/new']").click
end

Quando('preencho o campo Nome') do
  find('#report_name').send_keys Faker::Name.name
end

Quando('preencho o campo Resumo') do
  find('#report_short_description').send_keys Faker::TvShows::GameOfThrones.quote
end

Quando('preencho o campo Período') do
  find('#report_temporal').send_keys 'D'
end

Quando('preencho o campo Região') do
  find('#report_geographic').send_keys 'CO'
end

Quando('preencho o campo Preço Base') do
  find('#report_base_price').send_keys Faker::Number.number(digits: 2)
end

Quando('preencho o campo Descrição') do
  find('#report_description').send_keys Faker::TvShows::Simpsons.quote
end

Quando('clico no botão Criar Relatório') do
  find("input[name='commit']").click
end

Então('eu vejos a mensagem Relatório criado com sucesso') do
  expect(page).to have_content 'Relatório criado com sucesso.'
end
