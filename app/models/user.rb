class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :password, presence: true, format: { with:  /\A(\w*(\d+[a-zA-Z]|[a-zA-Z]+\d)\w*)+\z/}, length: { in: 6..15}
  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end
end
