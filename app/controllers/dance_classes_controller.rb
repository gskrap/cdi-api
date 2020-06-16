class DanceClassesController < ApplicationController
  before_action :set_dance_class, only: [:show, :update, :destroy, :get_dance_class_students]

  # GET /dance_classes
  def index
    @dance_classes = DanceClass.all
    render json: @dance_classes.order("start_time ASC"), include: [:groups, :location, :teachers]
  end

  # GET /dance_classes/1
  def show
    render json: @dance_class, include: [:groups, :teachers]
  end

  # POST /dance_classes
  def create
    @dance_class = DanceClass.new(dance_class_params[:dance_class])
    if @dance_class.save
      @group_dance_class_ids = dance_class_params[:group_ids]
      @group_dance_class_ids.each do |id|
        GroupDanceClass.create(group_id: id, dance_class_id: @dance_class.id)
      end

      @teacher_dance_class_ids = dance_class_params[:teacher_ids]
      @teacher_dance_class_ids.each do |id|
        TeacherDanceClass.create(teacher_id: id, dance_class_id: @dance_class.id)
      end
      render json: @dance_class, status: :created, location: @dance_class
    else
      render json: @dance_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dance_classes/1
  def update
    if @dance_class.update(dance_class_params[:dance_class])
      @dance_class.group_dance_classes.destroy_all
      @group_dance_class_ids = dance_class_params[:group_ids]
      @group_dance_class_ids.each do |id|
        GroupDanceClass.create(group_id: id, dance_class_id: @dance_class.id)
      end

      @dance_class.teacher_dance_classes.destroy_all
      @teacher_dance_class_ids = dance_class_params[:teacher_ids]
      @teacher_dance_class_ids.each do |id|
        TeacherDanceClass.create(teacher_id: id, dance_class_id: @dance_class.id)
      end
      render json: @dance_class
    else
      render json: @dance_class.errors, status: :unprocessable_entity
    end
  end

  # get /dance_classes/1/students
  def get_dance_class_students
    render json: @dance_class.students.student.sort_by{|s| s.first_name}
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

    def dance_class_params
      params.permit!
    end
end
