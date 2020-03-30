# frozen_string_literal: true

Dado('que eu acesso o site Marketplace') do
  visit 'localhost:3000'
end

Quando('informo o email') do
  find('#user_email').send_keys 'viniciusfnc.mb@gmail.com'
end

Quando('informo a senha') do
  find('#user_password').send_keys 'tatuvil'
end

Quando('clico no botão Entrar') do
  find("input[name='commit']").click
end

Então('eu quero ver a mensagem Autenticação efetuada com sucesso.') do
  expect(page).to have_content 'Autenticação efetuada com sucesso.'
end
