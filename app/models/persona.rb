#coding: utf-8

class Persona < ActiveRecord::Base
  attr_accessible :apellido, :email, :fechaNacimiento, :genero, :hashed_password, :nombre, :salt, :username,:password, :password_confirmation, :activo, :codigo, :personas, :cant_cont_bloq, :bloqueado
  
  scope :activo, -> { where activo: true }
  
  has_many :imagens
  has_many :noticia
  has_many :videos
  has_many :calificaciones
  has_many :comments
  has_many :notificaciones

  has_one :tipo_usuario

  validate :nombre_must_be_present

  validate :apellido_must_be_present

  validate :usuario_must_be_present

  validate :usuario_must_be_unique

  validate :email_must_be_present

  validate :email_must_be_unique

  validate :email_must_be_valid

  validate  :password_must_be_present

  validate :password_confirmation_equal


  attr_accessor :password_confirmation
  attr_reader   :password

#funciones de comprobacion de errores
  def nombre_must_be_present
    palabra = ""
    self.nombre.scan(/\w+/) do |a|
        palabra = palabra + " " + a.capitalize 
    end
    self.nombre = palabra 
	self.nombre.gsub! /\s+/, ' '
	self.nombre.split(' ').join(' ')
	errors.add(" ", "El Nombre no puede estar en blanco.") unless nombre.present?
  end

  def apellido_must_be_present
    palabra = ""
    self.apellido.scan(/\w+/) do |a|
        palabra = palabra + " " + a.capitalize 
    end
    self.apellido = palabra 
	self.apellido.gsub! /\s+/, ' '
	self.apellido.split(' ').join(' ')
  errors.add(" ", "El Apellido no puede estar en blanco.") unless apellido.present?
  end

  def usuario_must_be_present
    self.username = self.username.downcase
	self.username.gsub! /\s+/, ''
	self.username.split(' ').join('')
        errors.add(" ", "El Usuario no puede estar en blanco.") unless username.present?
  end

  def email_must_be_present
    self.email = self.email.downcase
	self.email = email.delete(' ')
        errors.add(" ", "El Email no puede estar en blanco.") unless email.present?
  end

  def usuario_must_be_unique
    if username.present?
    	self.username.delete(' ')
    	errors.add(" ", "El Usuario seleccionado ya se encuentra registrado.") unless Persona.find_all_by_username(username).at(0).nil?
    end
  end

  def email_must_be_unique	
    if email.present?
	errors.add(" ", "El Email seleccionado ya se encuentra registrado.") unless Persona.find_all_by_email(email).at(0).nil?
    end
  end
  def email_must_be_valid
    if email.present?
	errors.add(" ", "Por favor ingrese una dirección de email válida.") unless es_correo_valido? (self.email)
    end
  end
  def password_must_be_present
    unless hashed_password.present?
    	errors.add(" ", "Debe ingresar una contraseña.") 
    else
	unless self.password.size > 3 
		errors.add(" ", "La contraseña debe tener más de 3 caracteres.") 
    	end
    end
  end
  def password_confirmation_equal
	if self.password.present?
	     errors.add(" ", "Las contraseñas ingresadas no coinciden.") unless self.password == self.password_confirmation
	end
  end
#Funciones adicionales
  def getEdad
    hoy = Date.today
    edad = hoy.year.to_i - self.fechaNacimiento.year.to_i
    if(hoy.month.to_i < self.fechaNacimiento.month.to_i)
      edad -= 1
    else
      if(hoy.month.to_i == self.fechaNacimiento.month.to_i)
        if(hoy.day.to_i < self.fechaNacimiento.day.to_i)
          edad -= 1
        end
      end
    end
    return edad
  end
  def cambiar_pass pass
     self.update_attribute(:hashed_password, Persona.encrypt_password(pass, self.salt))
  end
  def activate!
    self.update_attribute(:activo, true)
  end

  def Persona.generate_activation_code
    size=10
    charset = %w{2 3 4 6 7 9 a b g k l m o r w z A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
# @param [Object] username
# @param [Object] password
  def Persona.authenticate(username, password)
    user = Persona.find_all_by_username(username)
    if ((!(user.at(0).nil?)) && (comprobar_pass(password, user.at(0))))
      return user.at(0)
    else
      return nil
    end
  end

  def Persona.comprobar_pass(pass, user)
    user.hashed_password == (encrypt_password(pass, user.salt)) ? user : nil
  end
# @param [Object] password
# @param [Object] salt
  def Persona.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  # 'password' is a virtual attribute
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end


  private
  def  es_correo_valido? (correoE)
	(correoE =~ /^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z])+$/)==0
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


end
