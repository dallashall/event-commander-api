class Status < ApplicationRecord
  validates :team_member, :detail, presence: true
end
