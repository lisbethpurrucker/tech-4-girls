class Quiz < ApplicationRecord
  belongs_to :lesson
  belongs_to :language
  has_many :questions
  has_many :user_quizzes
  has_many :users, through: :user_quizzes
end
