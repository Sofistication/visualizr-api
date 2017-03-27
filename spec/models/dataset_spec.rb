# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Dataset, type: :model do
  def dataset_params
    {
      name: 'Property Assessment',
      year: 2017,
      resource: '9a4b1173-89ac-4a01-93e7-661eeb81ba16'
    }
  end

  before(:all) do
    Dataset.create!(dataset_params)
  end

  after(:all) do
    Dataset.delete_all
  end

  describe 'retrieve_data' do
    it 'returns an object of type Tempfile' do
      expect(Dataset.first.retrieve_data.class).to eq(Tempfile)
    end
  end

  describe 'process_data' do
    it 'returns a hash' do
      expect(Dataset.first.process_data.class).to eq(Hash)
    end
  end
end
