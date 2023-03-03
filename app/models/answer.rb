class Answer < ApplicationRecord
  belongs_to :question

  validates :content, :correct, presence: true
  validates :content, uniqueness: true
end
