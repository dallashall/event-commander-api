# AR Model for event objects
class Event < ApplicationRecord
  validates :user, :title, presence: true # , :event_date
  belongs_to :user
  has_many :teams
  has_many :tasks
end
