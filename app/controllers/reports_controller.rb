class ReportsController < ApplicationController
  def index
    @reports = Report.sorted
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      flash[:notice] = 'Relatório criado com sucesso.'
      redirect_to(reports_path)
    else
      render('report')
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(report_params)
      flash[:notice] = 'Relatório atualizado com sucesso.'
      redirect_to(report_path(@report))
    else
      render('edit')
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    flash[:notice] = "Relatório '#{@report.name}' deletado com sucesso."
    redirect_to(reports_path)
  end

  private

  def report_params
    params.require(:report).permit(:name, :short_description, :description, :temporal,
      :kpis, :labels, :geographic, :base_price, :sample_path)
  end
end
