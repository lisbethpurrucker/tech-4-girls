class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  validates :title, presence: true
  validates :title, uniqueness: true
  validates_inclusion_of :multianswer, in: [true, false]
end
