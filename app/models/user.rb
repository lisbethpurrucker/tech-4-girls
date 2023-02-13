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
end
