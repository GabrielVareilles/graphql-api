class Favorite < ApplicationRecord
  belongs_to :user

  validates :codeCIS, uniqueness: { scope: :user }
end
