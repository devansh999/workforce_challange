class Organisation < ApplicationRecord
	validates_presence_of :name, :hourly_rate

  def users
  	User.where(organisation_id: id)
  end
end
