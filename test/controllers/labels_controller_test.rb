# frozen_string_literal: true

require 'test_helper'

class LabelsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #

  test 'should get index' do
    get dashboard_index_url
    assert_response :success
  end
end
