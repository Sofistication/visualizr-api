# frozen_string_literal: true

class VisualizationSerializer < ActiveModel::Serializer
  attributes :id, :color, :user, :dataset

  def user
    object.user.id
  end

  def dataset
    object.dataset.id
  end
end
