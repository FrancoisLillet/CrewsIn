class CreateMates < ActiveRecord::Migration[7.0]
  def change
    create_table :mates do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_user
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone_number
      t.text :address
      t.string :nationality
      t.string :country_of_residence
      t.string :passport_number
      t.date :expiration_date

      t.timestamps
    end
  end
end
