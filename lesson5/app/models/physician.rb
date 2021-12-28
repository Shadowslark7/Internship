class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :diagnosis_items

  validates :phone_number, :first_name, :last_name, presence: true
  validates :phone ,format: { with: /\A\+?380\d{9}\z/, message: "only UA format" }
  validates :level, presence: true, inclusion: { in: %w(junior middle senior), message: "%{value} is not a valid level" }
  validates :first_name presence: true inclusion: { minimum:2, message: "%{value} is too short" }
  validates :last_name presence: true inclusion: { minimum:2, message: "%{value} is too short" }
end
