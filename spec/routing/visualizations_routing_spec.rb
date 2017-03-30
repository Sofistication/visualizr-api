# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VisualizationsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/visualizations').to route_to('visualizations#index')
    end

    it 'routes to #show' do
      expect(:get => '/visualizations/1').to route_to('visualizations#show', :id => '1')
    end

    it 'routes to #create' do
      expect(:post => '/visualizations').to route_to('visualizations#create')
    end

    it 'routes to #update via PUT' do
      expect(:put => '/visualizations/1').to route_to('visualizations#update', :id => '1')
    end

    it 'routes to #update via PATCH' do
      expect(:patch => '/visualizations/1').to route_to('visualizations#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(:delete => '/visualizations/1').to route_to('visualizations#destroy', :id => '1')
    end

  end
end
