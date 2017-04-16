# AR Model for detail object
class Detail < ApplicationRecord
  validates :task, :team
  belongs_to :task
  belongs_to :team
end
