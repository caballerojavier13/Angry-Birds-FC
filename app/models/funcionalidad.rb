class Funcionalidad < ActiveRecord::Base
  attr_accessible :descripcion, :nombre

  has_many :tipo_usuario_funcionalidads
end
