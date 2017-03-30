# frozen_string_literal: true

class DatasetSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :resource, :zipcode_count, :visualizations

  def zipcode_count
    object.process_data
  end

  def visualizations
    object.visualizations.pluck(:id)
  end
end
