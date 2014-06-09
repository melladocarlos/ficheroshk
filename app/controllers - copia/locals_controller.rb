class LocalsController < ApplicationController
  
  def index  
    
          @locals = Local.all

  end  

  def show
    
          @local = Local.find(params[:id])
    
  end
  
  def new
    
          @local = Local.new
    
  end

  def create
    
    @local = Local.new(params[:local])

    if @local.save
      redirect_to locals_path, :notice => "Tu local se ha salvado"
    else
      render "new"
    end
  end
  
  def edit
    
          @local = Local.find(params[:id])

  end

  def update
    
    @local = Local.find(params[:id])
  
  if @local.update_attributes(params[:local]) 
    redirect_to locals_path, :notice => "Tu local se ha actualizado"
  else
    render "edit"
  end

end

  def destroy
    
    @local = Local.find(params[:id])
    @local.destroy
    redirect_to locals_path, :notice => "Tu local se ha borrado"


  end  
       
end