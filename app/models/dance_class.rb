class DanceClass < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User', foreign_key: 'teacher_id'

  has_many :group_dance_classes
  has_many :groups, through: :group_dance_classes

  has_many :students, -> { distinct }, through: :groups
end