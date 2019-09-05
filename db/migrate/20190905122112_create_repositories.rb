class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :language
      t.string :homepage

      t.timestamps
    end
  end
end
