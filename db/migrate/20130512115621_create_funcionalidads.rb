class CreateFuncionalidads < ActiveRecord::Migration
  def change
    create_table :funcionalidads do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
