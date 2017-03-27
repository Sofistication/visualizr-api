# frozen_string_literal: true
require 'open-uri'

class Dataset < ApplicationRecord
  def boston_dataset
    'https://data.boston.gov/api/action/datastore_search?resource_id='
  end

  def retrieve_data
    url = "#{boston_dataset}#{resource}"
    buffer = open(url)
    buffer
  end
end
