class Physician < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments

    validates :phone_number, :first_name, :last_name, presence: true
    validates :phone ,format: { with: /\A\+?380\d{9}\z/, message: "only UA format" }
    validates :level, presence: true, inclusion: { in: %w(junior middle senior), message: "%{value} is not a valid level" }
end
