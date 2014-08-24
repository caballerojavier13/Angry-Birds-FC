class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :usuario_id
      t.integer :noticia_id
      t.text :cuerpo

      t.timestamps
    end
  end
end
