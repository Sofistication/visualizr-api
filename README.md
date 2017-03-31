# Visualizr API

The API for [Visualizr](https://sofistication.github.io/visualizr) (Client repository [here](https://github.com/Sofistication/visualizr)). The API retrieves data from the City of Boston's open data API, performs some pre-processing actions on said data, and sends it to the client to be rendered into graphs. It also exposes the ability to save customized user visualizations for the datasets available to the API.

## ERDs

The following is the Entity Relationship Diagram for the first version of this app, this will likely change as more features are added.

![ERDs version 1](erdv1.jpg)

## API Endpoints

| Verb | URI pattern | Controller#Action |
|--|--|--|
| POST | `/sign-up` |	`users#signup` |
| POST | `/sign-in` |	`users#signin` |
| DELETE | `/sign-out/:id` |	`users#signout` |
| PATCH |	`/change-password/:id` |	`users#changepw` |
| GET | `/datasets` | `datasets#index` |
| GET | `/datasets/:id` | `datasets#show` |
| GET | `/visualizations` | `visualizations#index` |
| GET | `/visualizations/:id` | `visualizations#index` |
| POST | `/visualizations` | `visualizations#create` |
| PATCH | `visualizations/:id` | `visualizations#update` |
| DELETE | `visualizations/:id` | `visualizations#destroy` |

## Installation instructions

Clone this repo and run

- `bundle install`
- `bin/rake db:nuke_pave`
- `bin/rails server`

## Technologies used

The API is written in Ruby using the Ruby on Rails framework. It also interacts with the City of Boston's open data API, which is run by CKAN, to retrieve the data sets used.

## Unsolved problems

The main work that remains to be done on this API is to retrieve the full set of data from the City of Boston, rather than the first page of results. However due to the size of the full dataset, this would likely require implementation of some sort of caching in order to be able to respond to user requests in a timely manner. There is also an issue with some of the RSpec tests for this repository, [specifically the VisualizationsController unit tests](https://github.com/Sofistication/visualizr-api/issues/5), due to the requirement of having an authenticated user in order to perform non-read actions.
