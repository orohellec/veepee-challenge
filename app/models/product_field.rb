class ProductField < ApplicationRecord
  validates :name, presence: true
  validates :field_type, presence: true

  belongs_to :product_type
end
