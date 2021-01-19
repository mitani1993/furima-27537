class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :content
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id	
    validates :shipping_date_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }

  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_date
end
