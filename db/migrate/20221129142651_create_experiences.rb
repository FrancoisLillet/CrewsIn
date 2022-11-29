class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.string :country
      t.string :sailing_area
      t.date :start_date
      t.date :end_date
      t.string :role
      t.integer :number_of_miles
      t.string :boat_type
      t.integer :boat_length
      t.string :boat_model
      t.string :boat_owner

      t.timestamps
    end
  end
end
