class CreateMoneyTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :money_trackers do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
