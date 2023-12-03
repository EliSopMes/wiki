class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.integer :event_type
      t.string :organizer
      t.references :booker, foreign_key: { to_table: :users }
      t.references :tdl, foreign_key: { to_table: :users }
      t.references :adl, foreign_key: { to_table: :users }
      t.integer :pre_number_of_guests
      t.integer :rooms_used
      t.integer :invoice_status, default: 0
      t.text :schedule
      t.text :deliveries
      t.text :pick_ups
      t.integer :get_in
      t.text :get_in_info
      t.text :set_up_info
      t.integer :fire_place, default: 0
      t.boolean :self_payment
      t.text :gastro_info
      t.integer :catering, default: 0
      t.text :catering_info
      t.text :staff_info
      t.text :security_info
      t.string :fire_watch
      t.integer :cloakroom
      t.text :cloakroom_info
      t.text :other_info
      t.text :technical_info
      t.integer :post_number_of_guests
      t.text :post_event_info
      t.text :box_office_info
      t.text :broken_info
      t.text :external_staff_hours
      t.timestamps
    end
  end
end
