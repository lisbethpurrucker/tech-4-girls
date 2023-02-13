class UserWorld < ApplicationRecord
  belongs_to :user
  belongs_to :world
end
