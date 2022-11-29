class AddNauticalBioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nautical_bio, :text
  end
end
