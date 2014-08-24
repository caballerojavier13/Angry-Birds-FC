class AddRelacionPersonaTipoUsuario < ActiveRecord::Migration
  def up
	add_column :personas, :tipo_usuario_id, :integer
  end

  def down
  end
end
