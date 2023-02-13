class Video < ApplicationRecord
  belongs_to :lesson

  validates :title, :link, presence: true
  validates :title, :link, uniqueness: true
end
