class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :location
      t.string :lat
      t.string :long
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
