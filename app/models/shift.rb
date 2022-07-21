class Shift < ApplicationRecord
  belongs_to :user

  delegate :hourly_rate, to: :user, allow_nil: true

  validates_presence_of :start, :finish, :break_length

  validates :finish, comparison: { greater_than: :start }

  def break_length_in_minutes
    break_length.to_f/60
  end

  def hours_worked
    shift_length = (finish - start)/(60*60)
    (shift_length - break_length_in_minutes).round(2)
  end

  def cost
    (hours_worked * hourly_rate).round(2)
  end
end
