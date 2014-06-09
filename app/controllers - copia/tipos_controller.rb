class TiposController < ApplicationController
  
  def index  
        if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end
          @tipos = Tipo.all
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
          @tipo = Tipo.find(params[:id])
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
          @tipo = Tipo.new
        else
          redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def create
        if current_user
    @tipo = Tipo.new(params[:tipo])

    if @tipo.save
      redirect_to tipos_path, :notice => "Tu tipo se ha salvado"
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
          @tipo = Tipo.find(params[:id])
        else
          redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def update
        if current_user
    @tipo = Tipo.find(params[:id])
  
  if @tipo.update_attributes(params[:tipo]) 
    redirect_to tipos_path, :notice => "Tu tipo se ha actualizado"
  else
    render "edit"
  end
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
end

  def destroy
        if current_user
    @tipo = Tipo.find(params[:id])
    @tipo.destroy
    redirect_to tipos_path, :notice => "Tu tipo se ha borrado"
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end


  end    

end