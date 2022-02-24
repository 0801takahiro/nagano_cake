class Item < ApplicationRecord
    
    has_many :cart_items
    validates :price, presence: true
    
    def add_tax_price
        (self.price*1.10).round
    end
end
