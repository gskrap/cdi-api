class DanceClassesController < ApplicationController
  before_action :set_dance_class, only: [:show, :update, :destroy]

  # GET /dance_classes
  def index
    @dance_classes = DanceClass.all

    render json: @dance_classes, include: [:teacher, :groups]
  end

  # GET /dance_classes/1
  def show
    render json: @dance_class
  end

  # POST /dance_classes
  def create
    @dance_class = DanceClass.new(dance_class_params)

    if @dance_class.save
      render json: @dance_class, status: :created, location: @dance_class
    else
      render json: @dance_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dance_classes/1
  def update
    if @dance_class.update(dance_class_params)
      render json: @dance_class
    else
      render json: @dance_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dance_classes/1
  def destroy
    @dance_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dance_class
      @dance_class = DanceClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dance_class_params
      params.require(:dance_class).permit(:name, :teacher_id, :start_time)
    end
end
