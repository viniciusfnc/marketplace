# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reports', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:report) { FactoryBot.create(:report) }

  it "creates a Report and redirects to the Report's page" do
    sign_in user

    get '/reports/new'
    expect(response).to render_template(:new)

    post '/reports', params: { report: report.attributes }

    expect(response).to redirect_to(assigns(:reports))
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Relatório criado com sucesso.')
  end

  it 'does not render a different template' do
    get '/reports/new'
    expect(response).to_not render_template(:show)
  end

  it '' do
  end
end
