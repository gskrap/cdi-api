class AddLocationIdToDanceClasses < ActiveRecord::Migration[5.0]
  def change
    add_column :dance_classes, :location_id, :integer
  end
end
