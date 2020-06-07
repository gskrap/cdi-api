class TeacherDanceClass < ActiveRecord::Base
  validates :teacher_id, presence: true
  validates :dance_class_id, presence: true

  belongs_to :teacher, class_name: 'User'
  belongs_to :dance_class
end
