class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :password_hash
      t.string :password_salt
      t.integer :ficha_id
      t.integer :cargo_id

      t.timestamps
    end
  end
end
