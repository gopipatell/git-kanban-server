class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :github_name
      t.string :image

      t.timestamps
    end
  end
end
