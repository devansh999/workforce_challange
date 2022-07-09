class Organisation < ApplicationRecord
	validates :name, presence: true
  validates :hourly_rate, presence: true
end
