class CreateActividads < ActiveRecord::Migration
  def change
    create_table :actividads do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
