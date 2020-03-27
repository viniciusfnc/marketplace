# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @reports = Report.sorted
  end
end
