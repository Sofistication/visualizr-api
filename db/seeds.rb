# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

PROPERTY_ASSESSMENT = [
  {
    name: 'Property Assessment',
    year: 2017,
    resource: '9a4b1173-89ac-4a01-93e7-661eeb81ba16'
  },
  {
    name: 'Property Assessment',
    year: 2016,
    resource: '3d2be708-52dc-4707-b3b9-bdf385bed257'
  },
  {
    name: 'Property Assessment',
    year: 2015,
    resource: 'bdb17c2b-e9ab-44e4-a070-bf804a0e1a7f'
  },
  {
    name: 'Property Assessment',
    year: 2014,
    resource: '7190b0a4-30c4-44c5-911d-c34f60b22181'
  }
].freeze

PROPERTY_ASSESSMENT.each do |dataset|
  Dataset.create(dataset)
end
