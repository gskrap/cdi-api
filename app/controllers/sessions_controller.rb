class SessionsController < ApplicationController
  def create
    username = params[:session][:username]
    password = params[:session][:password]
    @user = User.find_by(username: username)

    if @user && @user.authenticate(password)
      @user.generate_authentication_token!
      @user.save
      render json: @user, status: 200
    else
      render json: { errors: "Invalid username or password" }, status: 422
    end
  end

  def destroy
    @user = User.find_by(auth_token: params[:id])
    @user.generate_authentication_token! if @user
    @user.save if @user
    head 204
  end
end
