# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  validates :codeCIS, uniqueness: { scope: :user }

  scope :active, -> { where(status: 'active') }

  enum status: %i[active archived]
end
