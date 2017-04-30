class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :date_of_birth, :timestamp
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :emergency_contact_id, :integer
    add_column :users, :gender, :integer, default: 0
    add_column :users, :alumni, :boolean, default: false
  end
end