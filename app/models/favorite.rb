# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user

  validates :codeCIS, uniqueness: { scope: :user }

  enum status: %i[active archived]
end
