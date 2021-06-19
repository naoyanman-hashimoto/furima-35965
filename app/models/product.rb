class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :shipment_source
  belongs_to :time_required

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :description
    validates :price,
               numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
    validates :image
  end

  with_options numericality: { other_than: 1,message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :shipment_source_id
    validates :time_required_id
  end
end