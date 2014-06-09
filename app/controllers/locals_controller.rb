class LocalsController < ApplicationController
  
  def index  
    if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end
          @locals = Local.all
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
          @local = Local.find(params[:id])
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
          @local = Local.new
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def create
    if current_user
    @local = Local.new(params[:local])

    if @local.save
      redirect_to locals_path, :notice => "Tu local se ha salvado"
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
          @local = Local.find(params[:id])
    else
          redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def update
    if current_user
    @local = Local.find(params[:id])
  
  if @local.update_attributes(params[:local]) 
    redirect_to locals_path, :notice => "Tu local se ha actualizado"
  else
    render "edit"
  end
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
end

  def destroy
    if current_user
    @local = Local.find(params[:id])
    @local.destroy
    redirect_to locals_path, :notice => "Tu local se ha borrado"
  else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end  


  end  
       
end