class FichasController < ApplicationController
 helper_method :sort_column, :sort_direction  
  def index  
    
    
          @fichas = Ficha.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
        

  end  

  def show
          @ficha = Ficha.find(params[:id])
      

        @asistencias = Asistencia.where(ficha_id: @ficha.id)
        @pagos = Pago.where(ficha_id: @ficha.id)
        @local = Local.find_by_id(@ficha.local_id.to_i)
        @tipo = Tipo.find_by_id(@ficha.tipo_id.to_i)
        @cargo = Cargo.find_by_id(@ficha.cargo_id.to_i)
        @lugar = Lugar.find_by_id(@ficha.lugar_id.to_i)
        @actividad = Actividad.find_by_id(@ficha.actividad_id.to_i)
        @asistenciaParcial= @asistencias.select("date(mes_ano) as ordered_fecha, sum(horas) as total_horas").group("date(mes_ano)")
        @asistenciaParcial=@asistenciaParcial.where(mes_ano: (Time.now - 1.year)..Time.now)
        
        @pagoParcial= @pagos.select("date(mes_ano) as ordered_fecha, sum(valor) as total_horas").group("date(mes_ano)")
        @pagoParcial=@pagoParcial.where(mes_ano: (Time.now - 1.year)..Time.now)



  end
  
  def new

    @ficha = Ficha.new
        
  end

  def create    
        @ficha = Ficha.new(params[:ficha])
        if @ficha.save
          redirect_to new_ficha_path, :notice => "Tu ficha se ha salvado"
        else
          render "new"
        end    
  end
  
  def edit
    
    @ficha = Ficha.find(params[:id])
        
  end

  def update
    
    @ficha = Ficha.find(params[:id])
  
  if @ficha.update_attributes(params[:ficha]) 
    redirect_to fichas_path, :notice => "Tu ficha se ha actualizado"
  else
    render "edit"
  end
      
end

  def destroy
    @ficha = Ficha.find(params[:id])

    @ficha.destroy
    redirect_to fichas_path, :notice => "Tu ficha se ha borrado"
  end 

    private  
def sort_column  
  Ficha.column_names.include?(params[:sort]) ? params[:sort] : "nombre"  
end  
    
def sort_direction  
  %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
end  
end
