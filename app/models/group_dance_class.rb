class GroupDanceClass < ActiveRecord::Base
  validates :group_id, presence: true
  validates :dance_class_id, presence: true

  belongs_to :group
  belongs_to :dance_class
end