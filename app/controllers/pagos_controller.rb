class PagosController < ApplicationController
  helper_method :sort_column, :sort_direction  
  def index  

    if current_user
      if current_user.cargo_id == 2
        redirect_to pago_path (current_user)
      else
      end

    @pagos = Pago.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end

  end  

  def show

    if current_user
      @pagos = Pago.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
  
      if current_user.cargo_id == 2
        @pagos = @pagos.where(ficha_id: current_user)   
        @ficha = Ficha.find(current_user)    
      else
        @pagos = @pagos.where(ficha_id: params[:id])
        @ficha = Ficha.find(params[:id])
      end
    
    /@pago = Pago.find(params[:id])/
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end

  end
  
  def new
    if current_user
    @pago = Pago.new
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def create
    if current_user
    @nueva_pago = Pago.new(params[:pago])
    
   
    @nueva_pago.mes_ano= Date.new(
      params['pago']["fecha(1i)"].to_i,
      params['pago']["fecha(2i)"].to_i,
      1)

    /@pago.fecha= Time.new(
      params['pago']["fecha(1i)"].to_i,
      params['pago']["fecha(2i)"].to_i,
      params['pago']["fecha(3i)"].to_i)/


      if current_user.cargo_id == 2
        @nueva_pago.ficha_id=current_user.id
      else
      end


    if @nueva_pago.save
      redirect_to new_pago_path, :notice => "Tu pago se ha salvado"
    else
      render "new"
    end
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end
  
  def edit
    if current_user
    @pago = Pago.find(params[:id])
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end

  def update
    if current_user
    @pago = Pago.find(params[:id])

    @pago.mes_ano= Date.new(
      params['pago']["fecha(1i)"].to_i,
      params['pago']["fecha(2i)"].to_i,
      1)
  if @pago.update_attributes(params[:pago]) 
    redirect_to pagos_path, :notice => "Tu pago se ha actualizado"
  else
    render "edit"
  end
  else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
end

  def destroy
    if current_user
    @pago = Pago.find(params[:id])
    @pago.destroy
    redirect_to :back, :notice => "Tu pago se ha borrado"
    else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end
  end     


  private  
    def sort_column  
      Pago.column_names.include?(params[:sort]) ? params[:sort] : "fecha"  
    end  
        
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end  

end