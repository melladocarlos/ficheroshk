class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :nombre
      t.string :ubicacion
      t.string :fono

      t.timestamps
    end
  end
end
