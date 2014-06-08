class ExamensController < ApplicationController
  def index  
    @examens = Examen.all
  end  

  def show
    @examen = Examen.find(params[:id])
     @ficha = Ficha.find_by_id(@examen.ficha_id)
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