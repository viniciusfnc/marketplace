# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Kpis', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:kpi) { FactoryBot.create(:kpi) }

  it "creates a Kpi and redirects to the Kpi's page" do
    sign_in user

    get '/kpis/new'
    expect(response).to render_template(:new)

    post '/kpis', params: { kpi: kpi.attributes }

    expect(response).to redirect_to(assigns(:kpis))
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Kpi criado com sucesso.')
  end

  it 'edit a Kpi and redirects to the Kpi page' do
    sign_in user

    get "/kpis/#{kpi.id}/edit"
    expect(response).to render_template(:edit)

    put "/kpis/#{kpi.id}", params: { kpi: kpi.attributes }

    expect(response).to redirect_to(assigns(:kpis))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include('Kpi atualizado com sucesso.')
  end

  it "delete a Kpi and redirects to the Kpi's page" do
    sign_in user

    delete "/kpis/#{kpi.id}"

    expect(response).to redirect_to(:kpis)
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Kpi ', ' deletado com sucesso.')
  end
end
