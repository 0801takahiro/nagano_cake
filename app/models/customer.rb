class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items
  has_many :addresses
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (is_active == true)
  end
  def full_address
    '〒' + postal_code + ' ' + address + '   '
  end
  def full_name
  first_name + ' ' + last_name
  end
  validates :encrypted_password, length: { minimum: 6 }
     
end
