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
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :shipment_source_id
    validates :time_required_id
    validates :price
    validates :image
  end
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :burden_id, numericality: { other_than: 1 }
  validates :shipment_source_id, numericality: { other_than: 1 }
  validates :time_required_id, numericality: { other_than: 1 }
end