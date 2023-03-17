# frozen_string_literal: true

# app/models/world.rb

# Implements each Coding World for the students to pick and find lessons related to them
class World < ApplicationRecord
  has_many :lessons
  has_many :user_worlds
  has_many :users, through: :user_worlds

  validates :name, presence: true
  validates :name, uniqueness: true

  def completion
    # TODO: Method that gives us the completion of each world
  end
end
