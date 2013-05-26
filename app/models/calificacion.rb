class Calificacion < ActiveRecord::Base
  attr_accessible :noticia_id, :persona_id, :valor

  belongs_to :persona
  belongs_to :noticium
end
