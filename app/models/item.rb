class Item < ApplicationRecord
  belongs_to :brand, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :item_img

  validates :item_price_id, presence: true
end
