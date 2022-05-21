class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string "firstName"
      t.string "lastName"
      t.string "email"
      t.text "address"
      t.string "password_digest"

      t.timestamps
    end
  end
end
