class Actividad < ActiveRecord::Base
  attr_accessible :nombre, :descripcion  

  validates :nombre, :presence => true
  validates :nombre, :uniqueness => { :message => "Ya existe." }

  has_many :fichas
end 