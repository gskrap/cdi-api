class GroupsController < ApplicationController
  # GET /groups
  def index
    @groups = Group.all

    render json: @groups
  end
end
