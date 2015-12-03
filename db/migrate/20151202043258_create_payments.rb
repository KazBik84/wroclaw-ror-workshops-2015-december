class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.integer :amount
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
