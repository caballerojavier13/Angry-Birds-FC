class Function < ActiveRecord::Migration
  def up
    create_table :function do |t|
      t.string :name
    end
  end

  def down
  end
end
