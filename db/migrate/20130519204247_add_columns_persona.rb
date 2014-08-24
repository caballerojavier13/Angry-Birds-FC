class AddColumnsPersona < ActiveRecord::Migration
  def up
	add_column :personas, :activo, :boolean
	add_column :personas, :codigo, :string
  end

  def down
  end
end
