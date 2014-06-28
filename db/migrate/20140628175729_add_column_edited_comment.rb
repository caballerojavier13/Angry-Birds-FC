class AddColumnEditedComment < ActiveRecord::Migration
  def up
    add_column :comments, :edited, :boolean, :default => false
  end

  def down
  end
end
