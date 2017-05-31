class SessionsController < ApplicationController
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    @user = User.find_by(email: email)

    if @user && @user.authenticate(password)
      @user.generate_authentication_token!
      @user.save
      render json: @user, status: 200
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    @user = User.find_by(auth_token: params[:id])
    @user.generate_authentication_token! if @user
    @user.save if @user
    head 204
  end

  def user_status
    render json: {loggedIn: user_signed_in?, user: current_user}
  end
end

# store auth_token like this on JS side
# window.localStorage.setItem(key, value)

# get auth_token like this
# window.localStorage.getItem(key)

# put it in header
# Authorization: token
