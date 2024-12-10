class RenameTypeColumnInMoneyTrackers < ActiveRecord::Migration[8.0]
  def change
    rename_column :money_trackers, :type, :transaction_type
  end
end
