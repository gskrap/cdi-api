class UsersController < ApplicationController
  # before_action :authenticate_with_token!, only: [:update, :destroy]
  before_action :set_user, only: [:show, :dance_classes, :emergency_contacts, :create_emergency_contacts, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # GET /teachers
  def teachers
    @teachers = User.teacher

    render json: @teachers
  end

  # GET /users/1/dance_classes
  def dance_classes
    render json: @user.classes, include: [:teacher, :groups]
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
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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
      params.require(:user).permit(:username, :first_name, :last_name, :date_of_birth, :email, :phone,
        :emergency_contact_id, :gender, :alumni, :password)
    end

    def emergency_contact_params
      params.require(:emergency_contact).permit(:first_name, :last_name, :relationship, :email, :phone)
    end
end
