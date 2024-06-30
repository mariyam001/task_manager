require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { create(:user) }
  let(:task) { build(:task, user: user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(task).to be_valid
    end

    it 'is not valid without a title' do
      task.title = nil
      expect(task).not_to be_valid
    end

    it 'is not valid without a state' do
      task.state = nil
      expect(task).not_to be_valid
    end

    it 'is not valid without a deadline' do
      task.deadline = nil
      expect(task).not_to be_valid
    end

  end

  describe 'associations' do
    it { should belong_to(:user)}
  end
end