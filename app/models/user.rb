# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :datasets, through: :visualizations
  has_many :visualizations, dependent: :destroy
end
