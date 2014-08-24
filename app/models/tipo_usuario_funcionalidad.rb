class TipoUsuarioFuncionalidad < ActiveRecord::Base
  attr_accessible :funcionalidad, :tipoUsuario_id

  belongs_to :tipo_usuario
  belongs_to :funcionalidad
end
