class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.integer :ficha_id
      t.date :fecha
      t.integer :valor
      t.text :detalle
      t.date :mes_ano
      t.integer :tipo_id

      t.timestamps
    end
  end
end
