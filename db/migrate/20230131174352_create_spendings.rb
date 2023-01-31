class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.string :description
      t.integer :amount
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
