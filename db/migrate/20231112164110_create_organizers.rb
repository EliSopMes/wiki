class CreateOrganizers < ActiveRecord::Migration[7.0]
  def change
    create_table :organizers do |t|
      t.string :name
      t.string :contact_person
      t.string :email
      t.string :phone_number
      t.string :address
      t.timestamps
    end
  end
end
