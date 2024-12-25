class MoneyTrackersController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @money_trackers = current_user.money_trackers.order(created_at: :desc) # Fetch user-specific transactions
      @total_income = @money_trackers.where(transaction_type: "Income").sum(:amount)
      @total_expense = @money_trackers.where(transaction_type: "Expense").sum(:amount)
      @balance = @total_income - @total_expense
    end
  
    def create
      @money_tracker = current_user.money_trackers.new(money_tracker_params)
      if @money_tracker.save
        redirect_to money_trackers_path, notice: "Transaction added successfully."
      else
        redirect_to money_trackers_path, alert: @money_tracker.errors.full_messages.to_sentence
      end
    end
  
    private
  
    def money_tracker_params
      params.require(:money_tracker).permit(:description, :amount, :transaction_type, :date)
    end
  end
  