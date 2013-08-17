class EliminarTablasInnecesarias < ActiveRecord::Migration
  def up
    drop_table :tipo_usuario_funcionalidads
    drop_table :tipo_usuarios
    drop_table :funcionalidads
    remove_column :personas, :tipo_usuario_id 
  end

  def down
  end
end
