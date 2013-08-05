class Comment < ActiveRecord::Base
  attr_accessible :cuerpo, :noticia_id, :usuario_id, :updated_at

  belongs_to :usuario
  belongs_to :noticia
end
