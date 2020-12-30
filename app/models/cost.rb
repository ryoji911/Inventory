class Cost < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :sale
    validates :food_cost
    validates :utility_cost
    validates :labor_cost
    validates :rent
    validates :supply
    validates :inventory
    validates :last_inventory
    validates :date
  end
end
