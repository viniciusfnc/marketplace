# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Labels', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:label) { FactoryBot.create(:label) }

  it "creates a Label and redirects to the Label's page" do
    sign_in user

    get '/labels/new'
    expect(response).to render_template(:new)

    post '/labels', params: { label: label.attributes }

    expect(response).to redirect_to(assigns(:labels))
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Etiqueta criada com sucesso.')
  end

  it 'edit a Label and redirects to the Label page' do
    sign_in user

    get "/labels/#{label.id}/edit"
    expect(response).to render_template(:edit)

    put "/labels/#{label.id}", params: { label: label.attributes }

    expect(response).to redirect_to(assigns(:labels))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include('Etiqueta atualizada com sucesso.')
  end

  it "delete a Label and redirects to the Label's page" do
    sign_in user

    delete "/labels/#{label.id}"

    expect(response).to redirect_to(:labels)
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Etiqueta ', ' deletada com sucesso.')
  end
end
