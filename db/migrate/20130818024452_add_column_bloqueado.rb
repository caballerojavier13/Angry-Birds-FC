class AddColumnBloqueado < ActiveRecord::Migration
  def up
    add_column :personas, :bloqueado, :boolean
  end

  def down
  end
end
