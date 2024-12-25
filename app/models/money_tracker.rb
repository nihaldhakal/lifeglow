class MoneyTracker < ApplicationRecord
    validates :description, :amount, :transaction_type, :date, presence: true
end
