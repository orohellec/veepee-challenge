require 'rails_helper'

RSpec.describe ProductType, type: :model do
  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:fields).allow_destroy(true) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:fields) }
    it { should have_many(:products) }
  end
end
