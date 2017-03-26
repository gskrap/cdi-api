class CreateDanceClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :dance_classes do |t|
      t.string :name, null: false
      t.integer :teacher_id, null: false

      t.timestamps null: false
    end
  end
end
