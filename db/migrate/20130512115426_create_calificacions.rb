class CreateCalificacions < ActiveRecord::Migration
  def change
    create_table :calificacions do |t|
      t.integer :valor
      t.integer :persona_id
      t.integer :noticia_id

      t.timestamps
    end
  end
end
