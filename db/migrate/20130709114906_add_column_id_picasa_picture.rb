class AddColumnIdPicasaPicture < ActiveRecord::Migration
  def up
    add_column :imagens, :picasa_id, :string
  end

  def down
    
  end
end
