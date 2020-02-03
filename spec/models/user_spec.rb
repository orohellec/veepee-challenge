require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'database' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { should have_many(:products) }
  end
end
