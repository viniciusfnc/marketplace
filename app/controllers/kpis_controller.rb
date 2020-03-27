class KpisController < ApplicationController
  def index
    @kpis = Kpi.sorted
  end

  def show
    @kpi = Kpi.find(params[:id])
  end

  def new
    @kpi = Kpi.new
  end

  def create
    @kpi = Kpi.new(kpi_params)
    if @kpi.save
      flash[:notice] = 'Kpi criado com sucesso.'
      redirect_to(kpis_path)
    else
      render('kpi')
    end
  end

  def edit
    @kpi = Kpi.find(params[:id])
  end

  def update
    @kpi = Kpi.find(params[:id])
    if @kpi.update_attributes(kpi_params)
      flash[:notice] = 'Kpi atualizado com sucesso.'
      redirect_to(kpi_path(@kpi))
    else
      render('edit')
    end
  end

  def destroy
    @kpi = Kpi.find(params[:id])
    @kpi.destroy
    flash[:notice] = "Kpi '#{@kpi.name}' deletado com sucesso."
    redirect_to(kpis_path)
  end

  def kpi_params
    params.require(:kpi).permit(:name)
  end

end
