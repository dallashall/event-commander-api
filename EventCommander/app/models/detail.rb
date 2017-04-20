# AR Model for detail object
class Detail < ApplicationRecord
  validates :task, presence: true
  belongs_to :task
  has_one :event, through: :task
  has_one :user, through: :event
  has_many :detail_assignments
  has_many :teams, through: :detail_assignments
end
