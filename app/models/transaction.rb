class Transaction < ActiveRecord::Base
  belongs_to :lender
  belongs_to :borrower

  validates :lender_id, presence: true
  validates :borrower_id, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
end
