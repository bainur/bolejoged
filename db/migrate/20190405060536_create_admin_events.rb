class CreateAdminEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :sport_category_id
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :status
      t.float :lat
      t.float :lang
      t.float :price

      t.timestamps
    end

    add_index :events, :sport_category_id
  end
end
