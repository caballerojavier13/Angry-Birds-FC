class Noticium < ActiveRecord::Base
  attr_accessible :cuerpo, :imagen_id, :persona_id, :titulo, :updated_at

  belongs_to :persona

  has_many :calificaciones
  
  validates_presence_of :titulo, :on => :create, :message => "can't be blank"
end
