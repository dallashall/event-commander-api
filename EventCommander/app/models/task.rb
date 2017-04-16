# AR Model for task objects
class Task < ApplicationRecord
  validates :name, :event, presence: true
  belongs_to :event
  has_many :details
  has_many :sibling_tasks, through: :event, source: :tasks
  before_validation :set_initial_order

  def last_ordered_task
    sibling_tasks.order(order: :desc).first
  end

  def reorder(new_order)
    new_order > order ? move_down(new_order) : move_up(new_order)
  end

  private

  def set_initial_order
    self.order = last_ordered_task ? last_ordered_task.order + 1 : 1
  end

  def move_up(new_ord)
    sibling_tasks
      .where("order < #{self.order} AND order >= #{new_ord}")
      .each do |event|
      event.update_attributes(order: event.order + 1)
    end
    update_attributes(order: new_ord)
  end

  def move_down(new_ord)
    sibling_tasks
      .where("order > #{self.order} AND order <= #{new_ord}")
      .each do |event|
      event.update_attributes(order: event.order - 1)
    end
    update_attributes(order: new_ord)
  end
end
