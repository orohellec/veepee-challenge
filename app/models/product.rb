class Product < ApplicationRecord
  belongs_to :user
  belongs_to :product_type
  
  validates :name, presence: true
  validates :price, presence: true

  serialize :properties, Hash

  validate :validate_properties

  def validate_properties
    product_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add(field.name, "can't be blank")
      end
    end
  end

  def data_for_index_view
    {
      id: self.id,
      name: self.name,
      price: self.price,
      # need to come back here and do downcase in product creation for performance issues
      user: "#{self.user.first_name.downcase} #{self.user.last_name.downcase}" 
    }
  end
end
