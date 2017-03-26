class TestAdminController < ApplicationController
  def index
    if current_user && current_user.admin?
      render json: {user: "is admin"}
    else
      render json: {user: "is not admin"}
    end
  end
end