require 'rails_helper'

RSpec.describe 'Datasets', type: :request do
  def dataset_params
    {
      name: 'Property Assessment',
      year: 2017,
      resource: '9a4b1173-89ac-4a01-93e7-661eeb81ba16'
    }
  end

  def datasets
    Dataset.all
  end

  def dataset
    Dataset.first
  end

  before(:all) do
    Dataset.create!(dataset_params)
  end

  after(:all) do
    Dataset.delete_all
  end

  describe 'GET /datasets' do
    it 'lists all datasets' do
      get '/datasets'
      expect(response).to be_success
      datasets_response = JSON.parse(response.body)['datasets']
      expect(datasets_response.length).to eq(datasets.count)
      expect(datasets_response.first['name']).to eq(dataset['name'])
    end
  end

  describe 'GET /datasets/:id' do
    it 'shows one dataset' do
      get "/datasets/#{dataset.id}"

      expect(response).to be_success

      dataset_response = JSON.parse(response.body)['dataset']
      expect(dataset_response['id']).to eq(dataset['id'])
      expect(dataset_response['title']).to eq(dataset['title'])
    end
  end
end
