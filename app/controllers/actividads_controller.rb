class ActividadsController < ApplicationController
  def index  
    if current_user
          if current_user.cargo_id == 2
            redirect_to ficha_path (current_user)
          else
          end
          @actividads = Actividad.all
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
           @actividad = Actividad.find(params[:id])
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
          @actividad = Actividad.new
    else
          redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def create
    if current_user
    @actividad = Actividad.new(params[:actividad])

    if @actividad.save
      redirect_to actividads_path, :notice => "Tu actividad se ha salvado"
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

          @actividad = Actividad.find(params[:id])
    else
          redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def update
    if current_user
    @actividad = Actividad.find(params[:id])
  
  if @actividad.update_attributes(params[:actividad]) 
    redirect_to actividads_path, :notice => "Tu actividad se ha actualizado"
  else
    render "edit"
  end
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
end

  def destroy
    if current_user
    @actividad = Actividad.find(params[:id])
    @actividad.destroy
    redirect_to actividads_path, :notice => "Tu actividad se ha borrado"
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end     
end