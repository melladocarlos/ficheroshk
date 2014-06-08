class Cargo < ActiveRecord::Base
  attr_accessible :descripcion, :nombre
  has_many :users
end
