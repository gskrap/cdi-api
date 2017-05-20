class GroupStudent < ActiveRecord::Base
  validates :group_id, presence: true
  validates :student_id, presence: true
  validates_uniqueness_of :group_id, :scope => :student_id

  belongs_to :group
  belongs_to :student, class_name: 'User'
end
