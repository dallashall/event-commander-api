# AR Model for status objects
class Status < ApplicationRecord
  validates :team_member, :detail, presence: true
  belongs_to :team_member
  belongs_to :detail
end
