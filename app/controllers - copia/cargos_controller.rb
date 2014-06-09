class CargosController < ApplicationController
  
  def index  


    @cargos = Cargo.all

  end  

  def show
        
    @cargo = Cargo.find(params[:id])

  end
  
  def new
        
          @cargo = Cargo.new

  end

  def create
        
    @cargo = Cargo.new(params[:cargo])

    if @cargo.save
      redirect_to cargos_path, :notice => "Tu cargo se ha salvado"
    else
      render "new"
    end
        
  end
  
  def edit
        @cargo = Cargo.find(params[:id])
        
  end

  def update
        
    @cargo = Cargo.find(params[:id])
  
  if @cargo.update_attributes(params[:cargo]) 
    redirect_to cargos_path, :notice => "Tu cargo se ha actualizado"
  else
    render "edit"
  end
      
end

  def destroy
        
          @cargo = Cargo.find(params[:id])
          @cargo.destroy
          redirect_to cargos_path, :notice => "Tu cargo se ha borrado"
        
  end    

end