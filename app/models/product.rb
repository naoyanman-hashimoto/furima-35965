class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :shipment_source_id
    validates :time_required_id
    validates :price
    validates :image
  end
end
