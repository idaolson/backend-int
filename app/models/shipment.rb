class Shipment < ApplicationRecord
  has_many :shipment_items
  has_many :items, through: :shipment_items
  validates :customer_name, :email, presence: true
end
