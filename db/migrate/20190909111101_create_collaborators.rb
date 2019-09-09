class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.integer :user_id
      t.integer :repository_id
    end
  end
end
