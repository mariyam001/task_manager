class Task < ApplicationRecord
  STATES = ['Backlog', 'In-progress', 'Done'].freeze
  belongs_to :user

  validates :title, presence: true
  validates :state, presence: true
  validates :deadline, presence: true
end
