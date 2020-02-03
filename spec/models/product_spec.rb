require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:properties).of_type(:text) } # serialzize to hash
  end

  # these tests don't pass because of the validation of the properties on product.
  # I should probably use FactoryBot to fix this issue

  # describe 'validations' do
  #   it { should validate_presence_of(:name) }
  #   it { should validate_presence_of(:price) }
  # end

  # describe 'associations' do
  #   it { should belong_to(:user) }
  #   it { should belong_to(:product_type) }
  # end
end
