class Permission < ActiveRecord::Migration
  def up
    create_table :permission do |t|
      t.integer :role_id
      t.integer :function_id
    end
  end

  def down
  end
end
