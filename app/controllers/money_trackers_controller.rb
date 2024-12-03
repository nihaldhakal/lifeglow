class MoneyTrackersController < ApplicationController
    before_action :authenticate_user!
    def index
        @money_trackers = current_user.money_trackers
        @current_balance = calculate_balance(@money_trackers)
    end

    def create
        @money_tracker = current_user.money_trackers.new(money_tracker_params)
        if @money_tracker.save
            redirect_to money_trackers_path, notice:"Transactions added successfully"
        else
            redirect_to money_trackers_path, notice:"Failed to add transaction"
        end
    end

    private
    def money_tracker_params
        params.require(:money_tracker).permit(:amount, :type, :description)
    end
    
    def calculate_balance(transactions)
        income = transactions.where(type: "Income").sum(amount)
        expense = transactions.where(type: "Expense").sum(amount)
        income - expense
    end
end
