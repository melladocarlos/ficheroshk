class CargosController < ApplicationController
  
  def index  
        if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end

    @cargos = Cargo.all
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end  

  def show
        if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end
    @cargo = Cargo.find(params[:id])
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end
  
  def new
        if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end
          @cargo = Cargo.new
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def create
        if current_user
    @cargo = Cargo.new(params[:cargo])

    if @cargo.save
      redirect_to cargos_path, :notice => "Tu cargo se ha salvado"
    else
      render "new"
    end
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end
  
  def edit
        if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end
           @cargo = Cargo.find(params[:id])
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def update
        if current_user
    @cargo = Cargo.find(params[:id])
  
  if @cargo.update_attributes(params[:cargo]) 
    redirect_to cargos_path, :notice => "Tu cargo se ha actualizado"
  else
    render "edit"
  end
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
end

  def destroy
        if current_user
          @cargo = Cargo.find(params[:id])
          @cargo.destroy
          redirect_to cargos_path, :notice => "Tu cargo se ha borrado"
        else
          redirect_to root_path, :notice => "Debe iniciar sesión."
        end


  end    

end