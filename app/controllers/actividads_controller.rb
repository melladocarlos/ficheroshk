class ActividadsController < ApplicationController
  def index  
    
          @actividads = Actividad.all    
  end  

  def show    
           @actividad = Actividad.find(params[:id])    
  end
  
  def new    
          @actividad = Actividad.new    
  end

  def create
    @actividad = Actividad.new(params[:actividad])
    
    if @actividad.save
      redirect_to actividads_path, :notice => "Tu actividad se ha salvado"
    else
      render "new"
    end
  end
  
  def edit
    
          @actividad = Actividad.find(params[:id])
    
  end

  def update
    
    @actividad = Actividad.find(params[:id])
  
  if @actividad.update_attributes(params[:actividad]) 
    redirect_to actividads_path, :notice => "Tu actividad se ha actualizado"
  else
    render "edit"
  end
end

  def destroy
    
    @actividad.destroy
    redirect_to actividads_path, :notice => "Tu actividad se ha borrado"
      
  end     
end