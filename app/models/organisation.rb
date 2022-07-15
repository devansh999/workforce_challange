class Organisation < ApplicationRecord
	validates :name, presence: true

  def users
  	User.where(organisation_id: id)
  end
end
