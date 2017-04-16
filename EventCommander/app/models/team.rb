class Team < ApplicationRecord
  validates :event, :name
  belongs_to :event
end
