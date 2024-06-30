require 'rails_helper'
RSpec.describe User, type: :model do
  user = FactoryBot.build(:user)

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user.email = nil
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user.password = nil
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:tasks) }
  end

  it "returns the full name" do
      expect(user.full_name).to eq("Test User")
    end
end