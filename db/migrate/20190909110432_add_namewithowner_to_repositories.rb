class AddNamewithownerToRepositories < ActiveRecord::Migration[5.2]
  def change
    add_column :repositories, :namewithowner, :string
  end
end
