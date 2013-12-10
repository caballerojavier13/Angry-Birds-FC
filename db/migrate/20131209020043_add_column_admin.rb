class AddColumnAdmin < ActiveRecord::Migration
  def up
    add_column :personas, :admin, :boolean
  end

  def down
  end
end
