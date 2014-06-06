class Permission < ActiveRecord::Migration
  def up
    drop_table :permissions
    create_table :permissions do |t|
      t.integer :role_id
      t.integer :function_id
    end
  end

  def down

  end
end
