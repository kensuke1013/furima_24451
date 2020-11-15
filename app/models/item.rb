class Item < ApplicationRecord
  belongs_to :brand, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :item_img
  belongs_to_active_hash :shipmentsource

  validates :name, :item_img, :introduction, :genre_id, :itemstatus_id, :deliveryfee_id, :shipmentsource_id, :daystoship_id, presence: true

  validates :item_price_id, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999 }
end