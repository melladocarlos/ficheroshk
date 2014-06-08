class Tipo < ActiveRecord::Base
  attr_accessible :descripcion, :nombre
  validates :nombre, :uniqueness => { :message => "Ya existe." }

  validates :nombre, :presence => true
  has_many :pagos
end
