class AddCommentToExperiences < ActiveRecord::Migration[7.0]
  def change
    add_column :experiences, :comment, :text
  end
end
