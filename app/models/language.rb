class Language < ApplicationRecord
	has_many :lessons
	has_many :quizzes
end
