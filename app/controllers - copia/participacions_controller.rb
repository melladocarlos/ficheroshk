class ParticipacionsController < ApplicationController
  def index  
    @participacions = Participacion.all
  end  

  def show
    
    @participacions = Participacion.where(ficha_id: params[:id])
    @ficha = Ficha.find(params[:id])
  end
  
  def new
    @participacion = Participacion.new
  end

  def create
    @participacion = Participacion.new(params[:participacion])

    if @participacion.save
      redirect_to participacions_path, :notice => "Tu participacion se ha salvado"
    else
      render "new"
    end
  end
  
  def edit
    @participacion = Participacion.find(params[:id])
  end

  def update
    @participacion = Participacion.find(params[:id])
  
  if @participacion.update_attributes(params[:participacion]) 
    redirect_to participacions_path, :notice => "Tu participacion se ha actualizado"
  else
    render "edit"
  end
end

  def destroy
    @participacion = Participacion.find(params[:id])
    @participacion.destroy
    redirect_to participacions_path, :notice => "Tu participacion se ha borrado"
  end     
end