class DanceClass < ActiveRecord::Base
  belongs_to :location, counter_cache: true

  has_many :group_dance_classes
  has_many :groups, through: :group_dance_classes

  has_many :teacher_dance_classes
  has_many :teachers, class_name: 'User', through: :teacher_dance_classes

  has_many :students, -> { distinct }, through: :groups
end
