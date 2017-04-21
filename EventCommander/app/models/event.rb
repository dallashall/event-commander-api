# AR Model for event objects
class Event < ApplicationRecord
  validates :user, :title, presence: true # , :event_date
  belongs_to :user
  has_many :teams
  has_many :team_members, through: :teams
  has_many :tasks
  has_many :details, through: :tasks

  def create_statuses
    details.each(&:create_statuses)
  end

  def send_invites
    team_members.each { |team_member| puts "Inviting team_member: #{team_member.id}" }
  end
end
