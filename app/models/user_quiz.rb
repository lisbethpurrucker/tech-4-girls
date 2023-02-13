class UserQuiz < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  enum status: { not_started: 0, started: 1, completed: 2, failed: -1 }
end
