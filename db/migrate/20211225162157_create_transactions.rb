class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :partner, null: false, foreign_key: true
      t.integer :points
      t.boolean :redeemed, :default => false
      t.datetime :timestamp, :default => Time.now.iso8601
      t.timestamps
    end
  end
end