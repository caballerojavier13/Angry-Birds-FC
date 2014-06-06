class Function < ActiveRecord::Migration
  def up
    create_table :functions do |t|
      t.string :name
    end
  end

  def down
  end
end
