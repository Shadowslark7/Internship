class Patient < ApplicationRecord
    has_many :appointments
    has_many :physicians, through: :appointments
    has_many :diagnosis_items
    
    validates :age, :email, :first_name, :last_name, presence: true
    validates :first_name, :last_name, length: 2..20 
    validates :age, numericality: { only_intenger: true }
    validates :age,  format:{ with: /\A.{1,100}\z/ }
    validates :email, format: {with: /\A^[a-z0-9]+@[a-z0-9]+\.[a-z]+\z/ }
end
