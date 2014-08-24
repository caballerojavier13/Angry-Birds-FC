class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellido
      t.string :username
      t.string :salt
      t.string :hashed_password
      t.string :email
      t.boolean :genero
      t.date :fechaNacimiento

      t.timestamps
    end
  end
end
