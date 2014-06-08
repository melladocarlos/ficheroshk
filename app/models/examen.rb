class Examen < ActiveRecord::Base
  attr_accessible :fecha, :ficha_id, :detalle, :pagado
  validates :ficha_id, :presence => true
  belongs_to :ficha 
end