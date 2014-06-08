class Pago < ActiveRecord::Base
  	attr_accessible :fecha, :ficha_id, :detalle, :valor,:mes_ano,:recibo, :tipo_id

    validates :valor, :tipo_id, :presence => true
    validates :ficha_id, :presence => true
	  has_attached_file :recibo
  	validates_attachment_content_type :recibo, :content_type => %w(image/jpeg image/jpg image/png)
  	validates_attachment :recibo,:size => { :in => 0..2150.kilobytes } 


  	belongs_to :tipo 
    belongs_to :ficha 


      def self.search(search)
    if search
      where('nombre LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end