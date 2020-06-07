class CreateTeacherDanceClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_dance_classes do |t|
      t.integer :teacher_id, null: false
      t.integer :dance_class_id, null: false

      t.timestamps null: false
    end
  end
end
