class ChangeOrganizerType < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :organizer, :string
    add_reference :events, :organizer, foreign_key: true
  end
end
