# frozen_string_literal: true

class AddStatusToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :status, :integer, null: false, default: 0
  end
end
