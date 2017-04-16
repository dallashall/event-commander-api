class TeamMember < ApplicationRecord
  validates :email, :name, :team
  belongs_to :team
end
