class CreateFichas < ActiveRecord::Migration
  def change
    create_table :fichas do |t|
      t.string :nombre
      t.string :rut
      t.date :fechanacimiento
      t.integer :local_id
      t.integer :tipo_id
      t.integer :lugar_id
      t.integer :actividad_id
      t.string :email
      t.string :fono
      t.string :password
      t.string :password_confirmation
      t.integer :cargo_id
      t.string :password_digest
      t.string :password_hash
      t.string :password_salt

      t.timestamps
    end
  end
end
