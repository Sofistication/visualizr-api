# frozen_string_literal: true

class Visualization < ApplicationRecord
  belongs_to :user
  belongs_to :dataset

  validates :user, :dataset, presence: true
end
