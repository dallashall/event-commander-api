# AR Model for detail object
class Detail < ApplicationRecord
  validates :task, presence: true
  belongs_to :task
  has_one :event, through: :task
  has_one :user, through: :event
  has_many :detail_assignments
  has_many :teams, through: :detail_assignments
  has_many :team_members, through: :teams

  def create_statuses
    team_members.each do |team_member|
      Status.create(team_member_id: team_member.id, detail_id: self.id)
    end
  end

end
