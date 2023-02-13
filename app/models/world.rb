class World < ApplicationRecord
	has_many :lessons
	has_many :worlds
	has_many :user_worlds
	has_many :users, through: :user_worlds
end
