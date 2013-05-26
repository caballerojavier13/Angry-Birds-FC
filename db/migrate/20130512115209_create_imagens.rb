class CreateImagens < ActiveRecord::Migration
  def change
    create_table :imagens do |t|
      t.string :url
      t.timestamp :updated_at
      t.integer :persona_id

      t.timestamps
    end
  end
end
