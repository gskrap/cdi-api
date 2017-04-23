class AddStartTimeToDanceClass < ActiveRecord::Migration[5.0]
  def change
    add_column :dance_classes, :start_time, :timestamp
  end
end
