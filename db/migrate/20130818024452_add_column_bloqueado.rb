class AddColumnBloqueado < ActiveRecord::Migration
  def up
    add_column :personas, :bloqueado, :boolean
    add_column :personas, :cant_cont_bloq, :integer
  end

  def down
  end
end
