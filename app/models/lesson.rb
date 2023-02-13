class Lesson < ApplicationRecord
  belongs_to :world
  belongs_to :language
  has_many :videos
  has_many :user_lessons
  has_many :users, through: :user_lessons

  validates :title, :duration, presence: true
  validates :title, uniqueness: true
end
