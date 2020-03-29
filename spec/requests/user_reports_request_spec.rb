# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserReports', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:report) { FactoryBot.create(:report) }
  let(:user_report) { FactoryBot.create(:user_report, user: user, report: report) }

  it "creates a UserReport and redirects to the UserReport's page" do
    sign_in user

    get '/user_reports/new', params: {report_id: report.id}
    expect(response).to render_template(:new)

    user_report.payment_method = 'C'
    user_report.notification_method = 'E'
    post '/user_reports', params: {user_report: user_report.attributes}

    expect(response).to redirect_to('/')
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Relatório', 'adquirido com sucesso.')
  end

  it 'error create invalidar UserReport ' do
    sign_in user

    expect{
      post '/user_reports', params: {user_report: user_report.attributes}
    }.to raise_error(ActiveRecord::NotNullViolation)
  end

  it "delete a UserReport and redirects to the UserReport's page" do
    sign_in user

    delete "/user_reports/#{user_report.id}"

    expect(response).to redirect_to('/')
    follow_redirect!

    expect(response).to render_template(:index)
    expect(response.body).to include('Relatório ', ' revogado com sucesso.')
  end
end
