class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_worlds
  has_many :worlds, through: :user_worlds
  has_many :user_quizzes
  has_many :quizzes, through: :user_quizzes
  has_many :user_lessons
  has_many :lessons, through: :user_lessons

  validates :first_name, :last_name, :user_name, presence: true
  validates :user_name, uniqueness: true

  def level
    (user_lessons.average(:progress).to_i / 10) + 1
  end
end
