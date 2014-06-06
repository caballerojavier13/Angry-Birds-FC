class PersonaConRol < ActiveRecord::Migration
  def up
    add_column :personas, :role_id, :integer
    Persona.update_all(role_id: Role.where("name = 'Usuario Comun'"))
  end

  def down
  end
end
