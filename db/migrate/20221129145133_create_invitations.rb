class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.references :sender, null: false
      t.references :receiver
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :invitations, :users, column: :sender_id
    add_foreign_key :invitations, :users, column: :receiver_id
  end
end
