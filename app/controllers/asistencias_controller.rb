class AsistenciasController < ApplicationController
  helper_method :sort_column, :sort_direction  
  
  def index  
    if current_user
      if current_user.cargo_id == 2
        redirect_to asistencia_path (current_user)
      else
      end
    @asistencias = Asistencia.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end  

  def show
    if current_user
      if current_user.cargo_id == 2
        @asistencias = Asistencia.where(ficha_id: current_user)   
        @ficha = Ficha.find(current_user)    
      else
        @asistencias = Asistencia.where(ficha_id: params[:id])
        @ficha = Ficha.find(params[:id])
      end
    @asistencias = @asistencias.all(:order => "fecha DESC")

    /@asistencia = Asistencia.find(params[:id])/
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end

  end
  
  def new
    if current_user
    @asistencia = Asistencia.new
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def create
    if current_user
    @nueva_asistencia = Asistencia.new(params[:asistencia])
    
   
    @nueva_asistencia.mes_ano= Date.new(
      params['asistencia']["fecha(1i)"].to_i,
      params['asistencia']["fecha(2i)"].to_i,
      1)
          if current_user.cargo_id == 2
            @nueva_asistencia.ficha_id=current_user.id
          else
          end

          if @nueva_asistencia.save
            redirect_to new_asistencia_path, :notice => "Tu asistencia se ha salvado"
          else
            render "new"
          end
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end
  

  def edit
    if current_user
    @asistencia = Asistencia.find(params[:id])
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end


  end

  def update
    if current_user
    @asistencia = Asistencia.find(params[:id])

    @asistencia.mes_ano= Date.new(
      params['asistencia']["fecha(1i)"].to_i,
      params['asistencia']["fecha(2i)"].to_i,
      1)

  
  if @asistencia.update_attributes(params[:asistencia]) 
    redirect_to asistencias_path, :notice => "Tu asistencia se ha actualizado"
  else
    render "edit"
  end
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
end

  def destroy
    if current_user
    @asistencia = Asistencia.find(params[:id])
    @asistencia.destroy
    redirect_to asistencias_path, :notice => "Tu asistencia se ha borrado"
      else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end

  end  
  private  
    def sort_column  
      Asistencia.column_names.include?(params[:sort]) ? params[:sort] : "fecha"  
    end  
        
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end     
end