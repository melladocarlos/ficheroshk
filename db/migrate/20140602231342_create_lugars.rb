class CreateLugars < ActiveRecord::Migration
  def change
    create_table :lugars do |t|
      t.string :nombre
      t.string :ubicacion

      t.timestamps
    end
  end
end
