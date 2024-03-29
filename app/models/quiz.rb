class Quiz < ApplicationRecord
  belongs_to :lesson
  has_many :questions
  has_many :user_quizzes
  has_many :users, through: :user_quizzes

  validates :duration, presence: true
end
