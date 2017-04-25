# frozen_string_literal: true
require 'open-uri'

class Dataset < ApplicationRecord
  has_many :users, through: :visualizations
  has_many :visualizations, dependent: :destroy

  validates :name, :year, :resource, presence: true

  def zipcode_count
    {}
  end

  def boston_dataset
    'https://data.boston.gov/api/action/datastore_search?resource_id='
  end

  def retrieve_data
    url = "#{boston_dataset}#{resource}"
    buffer = open(url)
    buffer
  end

  def paginate(url)
    full_url = "https://data.boston.gov#{url}"
    buffer = open(full_url)
    JSON.parse(buffer.read)
  end

  def strip_data(data_array, next_url)
    data_array.each do |row|
      zipcode = row['ZIPCODE']
      if zipcode_count[zipcode]
        zipcode_count[zipcode] += 1
      else
        zipcode_count[zipcode] = 1
      end
    end
    response = paginate next_url
    strip_data(response['result']['records'], response['result']['_links']['next'])
  end

  def process_data
    response = JSON.parse(retrieve_data.read)
    return Nil unless response['success']
    records = response['result']['records']
    next_url = response['result']['_links']['next']
    strip_data(records, next_url)
  end
end
