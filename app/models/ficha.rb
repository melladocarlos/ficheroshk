class Ficha < ActiveRecord::Base
  attr_accessible :fechanacimiento, :local_id, :nombre, :rut , :photo, :tipo_id,:lugar_id, :actividad_id, :correo,:fono, :password, :password_confirmation,:cargo_id,:email


  attr_accessor :password
  before_save :encrypt_password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  validates :rut, :actividad_id,:nombre,:cargo_id, :local_id, :fechanacimiento,:presence => true
  validates :nombre, :length => { :minimum => 2 }
  validates :rut, :uniqueness => { :message => "El rut existe" }
  validates :rut, :length => { :maximum => 12 }
  has_attached_file :photo,
                :path => ":rails_root/public/photo_attachment/:id/:style/:basename.:extension",
                :url => "/photo_attachment/:id/:style/:basename.:extension"

  validates_attachment_content_type :photo, :content_type => %w(image/jpeg image/jpg image/png)
  validates_attachment :photo,:size => { :in => 0..2150.kilobytes } 
  has_many :asistencias, :dependent => :delete_all
  belongs_to :cargo 



  def self.search(search)
    if search
      where('nombre LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  def self.authenticate(email, password)
    ficha = find_by_email(email)
    if ficha && ficha.password_hash == BCrypt::Engine.hash_secret(password, ficha.password_salt)
      ficha
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end


