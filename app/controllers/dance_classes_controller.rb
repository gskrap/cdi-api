class DanceClassesController < ApplicationController
  before_action :set_dance_class, only: [:show, :update, :destroy, :get_dance_class_groups, :get_dance_class_teachers, :get_dance_class_students, :update_dance_class_groups, :update_dance_class_teachers]

  # GET /dance_classes
  def index
    @dance_classes = DanceClass.all
    render json: @dance_classes.order("start_time ASC"), include: [:groups, :teachers]
  end

  # GET /dance_classes/1
  def show
    render json: @dance_class, include: [:groups, :teachers]
  end

  # POST /dance_classes
  def create
    @dance_class = DanceClass.new(dance_class_params)

    if @dance_class.save
#       @group_dance_class_ids = dance_class_group_params.select{|x,y| x.include?('for_group_id_') && y == true}.keys
#       @group_dance_class_ids.map!{|x| x.sub('for_group_id_','').to_i}
#       @group_dance_class_ids.each do |id|
#         GroupDanceClass.create(group_id: id, dance_class_id: @dance_class.id)
#       end

      render json: @dance_class, status: :created, location: @dance_class
    else
      render json: @dance_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dance_classes/1
  def update
    if @dance_class.update(dance_class_params[:dance_class])
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
#
#   # post /dance_classes/1/groups
#   def update_dance_class_groups
#     @dance_class.group_dance_classes.destroy_all
#     dance_class_update_group_params.each do |id, value|
#       @dance_class.group_dance_classes.create(group_id: id.to_i) if value
#     end
#     render json: @dance_class.group_dance_classes
#   end
#
#   # get /dance_classes/1/groups
#   def get_dance_class_groups
#     render json: @dance_class.group_dance_classes
#   end

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

#     def dance_class_group_params
#       params.require(:dance_class)
#     end

#     def dance_class_update_group_params
#       params.require(:values)
#     end
end
