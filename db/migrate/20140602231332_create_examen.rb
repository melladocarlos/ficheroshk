class CreateExamen < ActiveRecord::Migration
  def change
    create_table :examen do |t|
      t.integer :ficha_id
      t.date :fecha
      t.text :detalle
      t.string :pagado

      t.timestamps
    end
  end
end
