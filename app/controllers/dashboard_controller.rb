class DashboardController < ApplicationController
  def index
    @reports = Report.sorted
  end
end
