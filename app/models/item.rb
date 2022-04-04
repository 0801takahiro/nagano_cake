class Item < ApplicationRecord
    belongs_to :genre, optional: true
    has_many :cart_items
    has_many :order_details
    attachment :image
    validates :price, presence: true
    
    def add_tax_price
        (price*1.10).floor
    end
end
