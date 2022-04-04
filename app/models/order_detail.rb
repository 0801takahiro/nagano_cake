class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum is_active: { stop: 0, wait: 1, make: 2, comp: 3}
end
