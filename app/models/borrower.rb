class Borrower < ActiveRecord::Base
  has_secure_password

  has_many :transactions
  has_many :lenders, :through => :transactions

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, on: :createBorrower
  validates :title, :description, presence: true
  validates :amountneed, presence: true, numericality: { greater_than: 0 }
end
