# frozen_string_literal: true

class DatasetsController < ApplicationController
  before_action :set_dataset, only: :show

  # GET /datasets
  def index
    @datasets = Dataset.all.order(year: :desc)

    render json: @datasets
  end

  # GET /datasets/1
  def show
    render json: @dataset
  end

  # create, update, destroy not currently available
  # planned for future versions,
  # scaffold code preserved here with minor edits
  # # POST /datasets
  # def create
  #   @dataset = Dataset.new(dataset_params)
  #
  #   if @dataset.save
  #     head: :no_content
  #   else
  #     render json: @dataset.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /datasets/1
  # def update
  #   if @dataset.update(dataset_params)
  #     render json: @dataset
  #   else
  #     render json: @dataset.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /datasets/1
  # def destroy
  #   @dataset.destroy
  # end

  # Use callbacks to share common setup or constraints between actions.
  def set_dataset
    @dataset = Dataset.find(params[:id])
  end
  private :set_dataset

  # Only allow a trusted parameter "white list" through.
  # not currently needed, but will be when update and create are implemented
  # scaffold code preserved here with minor style edits
  # def dataset_params
  #   params.require(:dataset).permit(:name, :year, :resource)
  # end
  # private :dataset_params
end
