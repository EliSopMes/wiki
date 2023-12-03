class AddFieldsToUserTable < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :birthday, :datetime
    add_column :users, :phone_number, :string
  end
end
