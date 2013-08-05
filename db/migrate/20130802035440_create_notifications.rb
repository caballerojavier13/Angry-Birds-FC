class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :usuario_id
      t.integer :noticia_id
      t.boolean :read
      t.string :mensaje

      t.timestamps
    end
  end
end
