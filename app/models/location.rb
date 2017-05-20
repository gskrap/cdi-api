class Location < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :dance_classes
end
