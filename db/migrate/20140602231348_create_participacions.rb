class CreateParticipacions < ActiveRecord::Migration
  def change
    create_table :participacions do |t|
      t.integer :ficha_id
      t.date :fecha
      t.integer :evento_id
      t.text :detalle

      t.timestamps
    end
  end
end
