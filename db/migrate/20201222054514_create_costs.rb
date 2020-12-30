class CreateCosts < ActiveRecord::Migration[6.0]
  def change
    create_table :costs do |t|
      t.integer :sale,           null: false
      t.integer :food_cost,      null: false
      t.integer :utility_cost,   null: false
      t.integer :labor_cost,     null: false
      t.integer :rent,           null: false
      t.integer :supply,         null: false
      t.integer :other
      t.integer :inventory,      null: false
      t.integer :last_inventory, null: false
      t.date    :date,           null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
