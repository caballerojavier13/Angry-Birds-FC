class Comment < ActiveRecord::Base
  attr_accessible :cuerpo, :noticia_id, :persona_id, :updated_at

  belongs_to :persona
  belongs_to :noticia
end
