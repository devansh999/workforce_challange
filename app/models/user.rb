class User < ApplicationRecord
  belongs_to :organisation, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  delegate :hourly_rate, to: :organisation, allow_nil: true
end
