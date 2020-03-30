# frozen_string_literal: true

Dado('que eu esteja logado no sistema') do
  step 'que eu estou logado no sistema'
end

Quando('clico no menu Relatórios') do
  find("a[href='/reports']").click
end

Então('eu vejos a lista de relatórios') do
  expect(page).to have_content 'Adicionar novo relatório'
end
