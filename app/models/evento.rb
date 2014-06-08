class Evento < ActiveRecord::Base
  attr_accessible :fecha, :nombre, :descripcion

  validates :nombre, :uniqueness => { :message => "Ya existe." }


  	validates :nombre, :presence => true
  has_many :participacions
end