# frozen_string_literal: true

class UserReportsController < ApplicationController
  def show
    @user_report = UserReport.where(user_id: current_user.id, report_id: params[:id]).first
  end

  def new
    @user_report = UserReport.new
    @user_report.report = Report.find(params[:report_id])
  end

  def create
    @user_report = UserReport.new(user_report_params)
    @user_report.user = current_user
    @user_report.report = Report.find(params[:user_report][:report_id])

    if @user_report.save
      flash[:notice] = "Relatório '#{@user_report.report.name}' adquirido com sucesso."
      redirect_to(root_path)
    else
      flash[:alert] = @user_report.errors.full_messages
      render('new')
    end
  end

  def destroy
    @user_report = UserReport.find(params[:id])
    report_name = @user_report.report.name
    @user_report.destroy
    flash[:notice] = "Relatório '#{report_name}' revogado com sucesso."
    redirect_to(root_path)
  end

  private

  def user_report_params
    params.require(:user_report).permit(:user_id, :report_id, :dt_init, :dt_final, :payment_method,
                                        :notification_method)
  end
end
