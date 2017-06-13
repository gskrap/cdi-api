class AddSecondaryTeacherIdToDanceClasses < ActiveRecord::Migration[5.0]
  def change
    add_column :dance_classes, :secondary_teacher_id, :integer
  end
end
