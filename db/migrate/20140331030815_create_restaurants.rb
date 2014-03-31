class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :zip
      t.string :state
      t.string :phone

      t.timestamps
    end
  end
end
