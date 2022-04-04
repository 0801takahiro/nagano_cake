class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { wait: 0, check: 1, make: 2, standby:3, ship: 4}
    def full_address
      '〒' + postal_code + ' ' + address + '   '
    end
end
