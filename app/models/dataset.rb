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

  # def next_page(url)
  #   full_url = "https://data.boston.gov#{url}"
  #   buffer = open(full_url)
  #   buffer
  # end

  def strip_data(data_array)
    zipcode_count = {}
    data_array.each do |row|
      zipcode = row['ZIPCODE']
      if zipcode_count[zipcode]
        zipcode_count[zipcode] += 1
      else
        zipcode_count[zipcode] = 1
      end
    end
    zipcode_count
  end

  def process_data
    response = JSON.parse(retrieve_data.read)
    return Nil unless response['success']
    strip_data response['result']['records']
  end
end
