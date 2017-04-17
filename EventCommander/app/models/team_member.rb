# AR Model for team_member objects
class TeamMember < ApplicationRecord
  validates :email, :name, :team, :single_use_token, presence: true
  belongs_to :team
  before_validation :gen_single_use_token

  def gen_auth_token
    update_attributes(auth_token: SecureRandom.urlsafe_base64(32))
  end

  def gen_single_use_token
    self.single_use_token = SecureRandom.urlsafe_base64
  end

  def invite
    "http://localhost:3000/api/team_members/connect/#{self.single_use_token}"
  end
end
