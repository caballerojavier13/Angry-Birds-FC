class CreateUsrNovelties < ActiveRecord::Migration
  def change
    create_table :usr_novelties do |t|
      t.boolean :viewed
      t.integer :persona_id
      t.integer :novelty_id
      t.timestamps
    end
  end
end
