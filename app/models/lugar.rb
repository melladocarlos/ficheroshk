class Lugar < ActiveRecord::Base
  attr_accessible :nombre, :ubicacion
validates :nombre, :uniqueness => { :message => "Ya existe." }

    validates :nombre, :presence => true
  has_many :fichas
end 