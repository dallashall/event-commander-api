# AR Model for detail object
class Detail < ApplicationRecord
  validates :task, presence: true
  belongs_to :task
  has_many :detail_assignments
  has_many :teams, through: :detail_assignments
end
