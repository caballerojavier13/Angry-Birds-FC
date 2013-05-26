class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticia do |t|
      t.string :titulo
      t.text :cuerpo
      t.timestamp :updated_at
      t.integer :persona_id
      t.integer :imagen_id

      t.timestamps
    end
  end
end
