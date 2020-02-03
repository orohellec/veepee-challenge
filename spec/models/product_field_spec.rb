require 'rails_helper'

RSpec.describe ProductField, type: :model do
    describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:field_type).of_type(:string) }
    it { should have_db_column(:required).of_type(:boolean) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:product_type) }
  end
end
