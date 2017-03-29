# frozen_string_literal: true

class VisualizationsController < OpenReadController
  before_action :set_visualization, only: [:update, :destroy]

  # GET /visualizations
  def index
    @visualizations = Visualization.all

    render json: @visualizations
  end

  # GET /visualizations/1
  def show
    render json: Visualization.find(params[:id])
  end

  # POST /visualizations
  def create
    @visualization = current_user.visualizations.build(example_params)

    if @visualization.save
      render json: @visualization, status: :created
    else
      render json: @visualization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /visualizations/1
  def update
    if @visualization.update(visualization_params)
      head :no_content
    else
      render json: @visualization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /visualizations/1
  def destroy
    @visualization.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_visualization
    @visualization = current_user.visualizations.find(params[:id])
  end
  private :set_visualization

  # Only allow a trusted parameter "white list" through.
  def visualization_params
    params.require(:visualization).permit(:user_id, :dataset_id, :color)
  end
  private :visualization_params
end
