class RemoveTeacherIdFromDanceClass < ActiveRecord::Migration[5.0]
  def change
    remove_column :dance_classes, :teacher_id, :integer
  end
end
