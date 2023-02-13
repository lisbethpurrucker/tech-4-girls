class UserWorld < ApplicationRecord
  belongs_to :user
  belongs_to :world

  validates :active, presence: true
  validates :user_id, uniqueness: { scope: :world_id }
end
