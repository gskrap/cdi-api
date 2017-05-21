class AddDanceClassesCountToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :dance_classes_count, :integer, default: 0
  end
end
