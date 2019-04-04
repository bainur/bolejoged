class CreateUserInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_informations do |t|
      t.integer :user_id
      t.string :phone_number
      t.date :dob
      t.text :address
      t.timestamps
    end

    add_index :user_informations, :user_id
  end
end
