class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.date :fecha
      t.text :descripcion
      t.string :nombre

      t.timestamps
    end
  end
end
