class Imagen < ActiveRecord::Base
  attr_accessible :persona_id, :updated_at, :url, :picasa_id
 
  belongs_to :persona
  
  has_one :noticia
end
