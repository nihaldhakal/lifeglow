class MoneyTracker < ApplicationRecord
  belongs_to :user
  validates :amount, numericality: {greater_than: 0}
  validates :type, inclusion: { in: %w[Income Expense] }
  validates :description, presence: true
end
