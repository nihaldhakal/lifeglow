class MoneyTracker < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :user
  validates :amount, numericality: {greater_than: 0}
  validates :transaction_type, inclusion: { in: %w[Income Expense] }
  validates :description, presence: true
end
