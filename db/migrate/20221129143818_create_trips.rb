class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :country
      t.date :start_date
      t.date :end_date
      t.string :starting_point
      t.integer :max_capacity
      t.references :skipper
      t.references :creator, null: false

      t.timestamps
    end
    add_foreign_key :trips, :users, column: :skipper_id
    add_foreign_key :trips, :users, column: :creator_id
  end
end
