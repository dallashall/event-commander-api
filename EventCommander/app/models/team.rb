class Team < ApplicationRecord
  validates :event, :name, presence: true
  belongs_to :event
  has_one :user, through: :event
  has_many :detail_assignments
  has_many :details, through: :detail_assignments
end
