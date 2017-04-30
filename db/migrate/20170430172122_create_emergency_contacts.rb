class CreateEmergencyContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :relationship, null: false
      t.string :email, null: false
      t.string :phone, null: false
    end
  end
end