class Group < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :group_dance_classes
  has_many :dance_classes, through: :group_dance_classes

  has_many :group_students
  has_many :students, class_name: 'User', through: :group_students
end