class Local < ActiveRecord::Base
  attr_accessible :fono, :nombre, :ubicacion

  validates :nombre, :uniqueness => { :message => "El nombre existe" }
  
  validates :nombre, :presence => true
  has_many :fichas

end
