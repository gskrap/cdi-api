class UsersController < ApplicationController
  # before_action :authenticate_with_token!, only: [:update, :destroy]
  before_action :set_user, only: [:show, :dance_classes, :emergency_contacts, :create_emergency_contacts, :update, :update_user_groups, :get_user_groups, :destroy]

  # GET /users
  def index
    @users = User.order(:first_name)

    render json: @users, include: [:groups], :except=>  [:auth_token, :password_digest]
  end

  # GET /users/1
  def show
    render json: @user, include: [:groups], :except=>  [:auth_token, :password_digest]
  end

  # GET /teachers
  def teachers
    @teachers = User.where(archived: false, role: ["teacher", "admin"])

    render json: @teachers.sort_by{|t| t.first_name}, :except=>  [:auth_token, :password_digest]
  end

  # GET /users/1/dance_classes
  def dance_classes
    render json: @user.classes.sort_by{|a| a.start_time}, include: [:groups, :location, :teachers]
  end

  # GET /users/1/emergency_contacts
  def emergency_contacts
    render json: @user.emergency_contacts
  end

  # POST /users/1/emergency_contacts
  def create_emergency_contacts
    @emergency_contact = @user.emergency_contacts.new(emergency_contact_params)

    if @emergency_contact.save
      render json: @emergency_contact
    else
      render json: @emergency_contact.errors, status: :unprocessable_entity
    end
  end

  # POST /users
  def create
    @user = User.new(user_params[:user])

    if @user.save
      render json: @user, include: [:groups], status: :created, :except=>  [:password_digest], location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params[:user])
      @user.save
      render json: @user, include: [:groups], :except=>  [:auth_token, :password_digest]
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # post /users/1/groups
  def update_user_groups
    @user.group_students.destroy_all
    user_group_params.each do |id|
      @user.group_students.create(group_id: id)
    end
    render json: @user.group_students
  end

  # get /users/1/groups
  def get_user_groups
    render json: @user.group_students
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit!
    end

    def emergency_contact_params
      params.require(:emergency_contact).permit(:first_name, :last_name, :relationship, :email, :phone)
    end

    def user_group_params
      params.require(:values)
    end
end
