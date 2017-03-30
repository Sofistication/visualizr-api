# frozen_string_literal: true

class VisualizationSerializer < ActiveModel::Serializer
  attributes :id, :color, :user, :dataset, :editable

  def user
    object.user.id
  end

  def dataset
    object.dataset.id
  end

  def editable
    scope == object.user
  end
end
