# frozen_string_literal: true

Dado('que eu estou logado no sistema') do
  visit 'localhost:3000'
  find('#user_email').send_keys 'viniciusfnc.mb@gmail.com'
  find('#user_password').send_keys 'tatuvil'
  find("input[name='commit']").click
  expect(page).to have_content 'Autenticação efetuada com sucesso.'
end

Quando('clico no botão sair') do
  find("a[href='/users/sign_out']").click
end

Então('eu quero ver a mensagem Antes de continuar tem de se autenticar ou efetuar um registo.') do
  expect(page).to have_content 'Antes de continuar tem de se autenticar ou efetuar um registo.'
end
