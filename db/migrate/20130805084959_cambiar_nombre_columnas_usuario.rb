class CambiarNombreColumnasUsuario < ActiveRecord::Migration
  def up
	rename_column :comments, :usuario_id, :persona_id
        rename_column :notifications, :usuario_id, :persona_id
  end

  def down
  end
end
