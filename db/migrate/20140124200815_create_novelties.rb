class CreateNovelties < ActiveRecord::Migration
  def change
    create_table :novelties do |t|
      t.text :message

      t.timestamps
    end
  end
end
