class CreateTestimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.text :comment
      t.integer :rate, default: 0
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
