class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :titulo
      t.string :url
      t.timestamp :updated_at
      t.integer :persona_id

      t.timestamps
    end
  end
end
