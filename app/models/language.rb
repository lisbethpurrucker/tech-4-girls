class Language < ApplicationRecord
	has_many :lessons
	has_many :quizzes

	validates :name, presence: true
	validates :name, inclusion: { in: %w[html css javascript] }
	validates :name, uniqueness: true
end
