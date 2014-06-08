  	class Participacion < ActiveRecord::Base
  attr_accessible :ficha_id, :detalle , :evento_id,:fecha
  validates :evento_id, :presence => true
  validates :ficha_id, :presence => true
  belongs_to :evento 
  belongs_to :ficha
end

