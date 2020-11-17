class Item < ApplicationRecord
  belongs_to :brand, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :item_img
  belongs_to_active_hash :shipmentsource

  with_options presence: true do
    validates :name, :item_img, :introduction, :genre_id, :itemstatus_id, :deliveryfee_id, :shipmentsource_id, :daystoship_id
  end

  with_options numericality: { greater_than_or_equal_to: 2} do
    validates :genre_id, :itemstatus_id, :deliveryfee_id, :shipmentsource_id, :daystoship_id
  end
  

  validates :item_price_id, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 999_999 }
end