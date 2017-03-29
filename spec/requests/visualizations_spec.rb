# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Visualizations', type: :request do
  def visualization_params
    {
      dataset_id: Dataset.first.id,
      color: '#000000'
    }
  end

  def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def dataset_params
    {
      name: 'Property Assessment',
      year: 2017,
      resource: '9a4b1173-89ac-4a01-93e7-661eeb81ba16'
    }
  end

  def visualizations
    Visualization.all
  end

  def visualization
    Visualization.first
  end

  before(:all) do
    Dataset.create!(dataset_params)
    @user = User.create!(user_params)
    @user.visualizations.create!(visualization_params)
  end

  after(:all) do
    Visualization.delete_all
    Dataset.delete_all
    User.delete_all
  end

  context 'when authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{@token}"
      }
    end

    before(:each) do
      post '/sign-up', params: { credentials: user_params }
      post '/sign-in', params: { credentials: user_params }

      @token = JSON.parse(response.body)['user']['token']
      @user_id = JSON.parse(response.body)['user']['id']
    end

    describe 'GET /visualizations' do
      it 'is successful' do
        get '/visualizations', headers: headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        puts parsed_response
        expect(
          parsed_response['visualizations']
        ).not_to be_empty
      end
    end

    describe 'GET /visualizations/:id' do
      it 'is successful' do
        get "/visualizations/#{visualization.id}", headers: headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['visualization']
        ).not_to be_empty
      end
    end
  end

  context 'when not authenticated' do
    describe 'GET /visualizations' do
      it 'is successful' do
        get '/visualizations'

        expect(response).to be_success
      end
    end

    describe 'GET /visualizations/:id' do
      it 'is successful' do
        get "/visualizations/#{visualization.id}"

        expect(response).to be_success
      end
    end
  end
end
