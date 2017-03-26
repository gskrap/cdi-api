class CreateGroupStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :group_students do |t|
      t.integer :group_id, null: false
      t.integer :student_id, null: false

      t.timestamps null: false
    end
  end
end
