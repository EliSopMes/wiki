class AddCancelToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :canceled, :boolean, default: false
  end
end
