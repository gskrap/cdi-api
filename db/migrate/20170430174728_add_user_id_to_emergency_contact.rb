class AddUserIdToEmergencyContact < ActiveRecord::Migration[5.0]
  def change
    add_column :emergency_contacts, :user_id, :integer
  end
end