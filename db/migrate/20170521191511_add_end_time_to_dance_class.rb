class AddEndTimeToDanceClass < ActiveRecord::Migration[5.0]
  def change
    add_column :dance_classes, :end_time, :timestamp
  end
end
