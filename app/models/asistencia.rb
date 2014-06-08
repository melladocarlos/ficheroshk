class Asistencia < ActiveRecord::Base
  attr_accessible :fecha, :ficha_id, :horas,:mes_ano

  	validates :ficha_id, :presence => true
    belongs_to :ficha 

    def self.search(search)
    if search
      where('nombre LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  




end
