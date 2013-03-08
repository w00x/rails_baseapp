class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :hashed_password
      t.string :nombre
      t.string :apellidos
      t.boolean :activo

      t.timestamps
    end
  end
end
