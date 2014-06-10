class ExamensController < ApplicationController
  def index  
    @examens = Examen.all
  end  

  def show
    if current_user
      if current_user.cargo_id == 2
        @examens = Examen.where(ficha_id: current_user)   
        @ficha = Ficha.find(current_user)    
      else
        @examens = Examen.where(ficha_id: params[:id])
        @ficha = Ficha.find(params[:id])
      end
    @examens = @examens.all(:order => "fecha DESC")

    /@examen = Examen.find(params[:id])/
        else
      redirect_to root_path, :notice => "Debe iniciar sesión."
    end

  end
  
  def new
    @examen = Examen.new
  end

  def create
    @examen = Examen.new(params[:examen])






    if @examen.save
      redirect_to examens_path, :notice => "Tu examen se ha salvado"
    else
      render "new"
    end
  end
  
  def edit
    @examen = Examen.find(params[:id])
  end

  def update
    @examen = Examen.find(params[:id])
  
  if @examen.update_attributes(params[:examen]) 
    redirect_to examens_path, :notice => "Tu examen se ha actualizado"
  else
    render "edit"
  end
end

  def destroy
    @examen = Examen.find(params[:id])
    @examen.destroy
    redirect_to examens_path, :notice => "Tu examen se ha borrado"
  end     
end