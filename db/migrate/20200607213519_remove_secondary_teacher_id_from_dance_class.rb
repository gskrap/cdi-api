class RemoveSecondaryTeacherIdFromDanceClass < ActiveRecord::Migration[5.0]
  def change
    remove_column :dance_classes, :secondary_teacher_id, :integer
  end
end
