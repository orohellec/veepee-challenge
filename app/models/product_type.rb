class ProductType < ApplicationRecord
  has_many :fields, class_name: "ProductField" # dependent_destroy ??
  has_many :products

  validates :name, presence: true, uniqueness: true

  accepts_nested_attributes_for :fields, allow_destroy: true
end
