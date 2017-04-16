class TeamMember < ApplicationRecord
  validates :email, :name, :team, presence: true
  belongs_to :team
end
