class Event < ApplicationRecord
  validates :user, :title, :event_date
  belongs_to :user
  has_many :teams
  has_many :tasks
end
