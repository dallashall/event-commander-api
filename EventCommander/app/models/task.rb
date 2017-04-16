class Task < ApplicationRecord
  attr_reader :order
  validates :name, :event, :order
  belongs_to :event
  has_many :sibling_events,
    through: :event,
    source: :tasks
  before_validation :set_initial_order

  def last_ordered_task
    Event.where(id: this.event_id).order(event_id: :desc).first
  end

  def reorder(new_order)
    new_order > self.order ? move_down(new_order) : move_up(new_order)
  end

  private

  def set_initial_order
    self.order ||= last_ordered_task.order +1
  end

  def move_up(new_ord)
    sibling_events.where("order < #{self.order} AND order >= #{new_ord}").each do |event|
      event.update_attributes(order: event.order + 1)
    end
    self.update_attributes(order: new_ord)
  end

  def move_down(new_ord)
    sibling_events.where("order > #{self.order} AND order <= #{new_ord}").each do |event|
      event.update_attributes(order: event.order - 1)
    end
    self.update_attributes(order: new_ord)
  end
end
