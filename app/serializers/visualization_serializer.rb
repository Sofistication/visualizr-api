# frozen_string_literal: true

class VisualizationSerializer < ActiveModel::Serializer
  attributes :id, :color
  has_one :user
  has_one :dataset
end
