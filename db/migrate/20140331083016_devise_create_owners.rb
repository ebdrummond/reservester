class DeviseCreateOwners < ActiveRecord::Migration
  def change
    create_table(:owners) do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.timestamps
    end

    add_index :owners, :email,                unique: true
    add_index :owners, :reset_password_token, unique: true
  end
end
