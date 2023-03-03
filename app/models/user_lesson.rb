class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  enum status: { not_started: 0, started: 1, completed: 2, failed: -1 }

  validates :status, :progress, presence: true
  validates :user_id, uniqueness: { scope: :lesson_id }
end
