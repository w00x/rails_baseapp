class CreateUserRols < ActiveRecord::Migration
  def change
    create_table :user_rols do |t|
      t.references :user
      t.references :rol

      t.timestamps
    end
    add_index :user_rols, :user_id
    add_index :user_rols, :rol_id
  end
end
