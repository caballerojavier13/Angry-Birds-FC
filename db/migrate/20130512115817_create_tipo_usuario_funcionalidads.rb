class CreateTipoUsuarioFuncionalidads < ActiveRecord::Migration
  def change
    create_table :tipo_usuario_funcionalidads do |t|
      t.integer :tipoUsuario_id
      t.integer :funcionalidad

      t.timestamps
    end
  end
end
