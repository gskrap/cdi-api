class AddNotesToDanceClasses < ActiveRecord::Migration[5.0]
  def change
    add_column :dance_classes, :notes, :string, default: ""
  end
end
