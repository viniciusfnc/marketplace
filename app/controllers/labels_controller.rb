class LabelsController < ApplicationController
  def index
    @labels = Label.sorted
  end

  def show
    @label = Label.find(params[:id])
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      flash[:notice] = 'Etiqueta criada com sucesso.'
      redirect_to(labels_path)
    else
      render('label')
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update_attributes(label_params)
      flash[:notice] = 'Etiqueta atualizada com sucesso.'
      redirect_to(label_path(@label))
    else
      render('edit')
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
    flash[:notice] = "Etiqueta '#{@label.name}' deletada com sucesso."
    redirect_to(labels_path)
  end

  private

  def label_params
    params.require(:label).permit(:name)
  end

end
