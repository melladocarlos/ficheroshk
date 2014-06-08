class LugarsController < ApplicationController
  def index  
    @lugars = Lugar.all
  end  

  def show
    @lugar = Lugar.find(params[:id])
  end
  
  def new
    @lugar = Lugar.new
  end

  def create
    @lugar = Lugar.new(params[:lugar])

    if @lugar.save
      redirect_to lugars_path, :notice => "Tu lugar se ha salvado"
    else
      render "new"
    end
  end
  
  def edit
    @lugar = Lugar.find(params[:id])
  end

  def update
    @lugar = Lugar.find(params[:id])
  
  if @lugar.update_attributes(params[:lugar]) 
    redirect_to lugars_path, :notice => "Tu lugar se ha actualizado"
  else
    render "edit"
  end
end

  def destroy
    @lugar = Lugar.find(params[:id])
    @lugar.destroy
    redirect_to lugars_path, :notice => "Tu lugar se ha borrado"
  end     
end