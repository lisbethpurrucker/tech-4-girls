class UserQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  enum status: { not_started: 0, started: 1, completed: 2, failed: -1 }

  validates :user_id, uniqueness: { scope: :quiz_id }
  validates :status, :progress, presence: true
end
