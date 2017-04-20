class DetailAssignment < ApplicationRecord
  validates :team, :detail, presence: true
  belongs_to :detail
  belongs_to :team
  has_one :user, through: :detail # Owner. NOT assignee.
end
