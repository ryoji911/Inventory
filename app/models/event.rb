class Event < ApplicationRecord
  with_options presence: true do
    validates :title
  end
end
