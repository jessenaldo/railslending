class Lender < ActiveRecord::Base

  has_secure_password

  has_many :transactions
  has_many :borrowers, :through => :transactions

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i


  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, on: :createLender
  validates :balance, presence: true, numericality: { allow_nil: true }

end
