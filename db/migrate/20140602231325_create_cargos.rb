class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.text :descripcion
      t.string :nombre

      t.timestamps
    end
  end
end
