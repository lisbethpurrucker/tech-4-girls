class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  validates :title, :multianswer, presence: true
  validates :title, uniqueness: true
end
