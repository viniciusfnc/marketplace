# frozen_string_literal: true

require 'test_helper'

class KpisControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get kpis_index_url
    assert_response :success
  end

  test 'should get new' do
    get kpis_new_url
    assert_response :success
  end

  test 'should get edit' do
    get kpis_edit_url
    assert_response :success
  end

  test 'should get destroy' do
    get kpis_destroy_url
    assert_response :success
  end

  test 'should get show' do
    get kpis_show_url
    assert_response :success
  end
end
