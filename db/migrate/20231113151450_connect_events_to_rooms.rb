class ConnectEventsToRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :rooms_used, :integer
    create_table :events_rooms, id: false do |t|
      t.belongs_to :event
      t.belongs_to :room
    end
  end
end
