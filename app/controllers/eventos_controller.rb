class EventosController < ApplicationController
  def index  
    @eventos = Evento.all
  end  

  def show
    @evento = Evento.find(params[:id])
  end
  
  def new
    @evento = Evento.new
  end

  def create
    @evento = Evento.new(params[:evento])

    if @evento.save
      redirect_to eventos_path, :notice => "Tu evento se ha salvado"
    else
      render "new"
    end
  end
  
  def edit
    @evento = Evento.find(params[:id])
  end

  def update
    @evento = Evento.find(params[:id])
  
  if @evento.update_attributes(params[:evento]) 
    redirect_to eventos_path, :notice => "Tu evento se ha actualizado"
  else
    render "edit"
  end
end

  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy
    redirect_to eventos_path, :notice => "Tu evento se ha borrado"
  end     
end