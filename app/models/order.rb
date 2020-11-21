class Order < ApplicationRecord
  belongs_to :item
  has_one :user
end
