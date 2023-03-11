class Answer < ApplicationRecord
  belongs_to :question

  validates :content, presence: true
  validates :content, uniqueness: true
  validates_inclusion_of :correct, in: [true, false]
end
