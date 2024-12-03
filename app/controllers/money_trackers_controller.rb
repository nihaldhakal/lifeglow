class MoneyTrackersController < ApplicationController
    before_action :authenticate_user!
    def index
        @money_trackers = current_user.money_trackers
    end
    def create
        @income = current_user.money_trackers.new(money_trackers_params)
        @expense = current_user.money_trackers.new(money_trackers_params)
        @available_balance = @income.amount - @expense.amount
    end

    private
    def money_trackers_params
        params.require(:money_tracker).permit(:amount, :description)
    end
end
