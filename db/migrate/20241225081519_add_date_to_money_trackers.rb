class AddDateToMoneyTrackers < ActiveRecord::Migration[8.0]
  def change
    add_column :money_trackers, :date, :date
  end
end
