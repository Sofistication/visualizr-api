# frozen_string_literal: true
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :visualizations

  def visualizations
    object.visualizations.pluck(:id)
  end
end
