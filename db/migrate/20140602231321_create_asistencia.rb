class CreateAsistencia < ActiveRecord::Migration
  def change
    create_table :asistencia do |t|
      t.date :fecha
      t.integer :ficha_id
      t.integer :horas
      t.date :mes_ano

      t.timestamps
    end
  end
end
