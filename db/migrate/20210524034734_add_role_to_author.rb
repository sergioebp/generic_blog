class AddRoleToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :role, :string
  end
end
