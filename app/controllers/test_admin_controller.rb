class TestAdminController < ApplicationController
  def index
    if user_signed_in? && current_user.admin?
      render json: {user: "is admin"}
    else
      render json: {user: "is not admin"}
    end
  end
end