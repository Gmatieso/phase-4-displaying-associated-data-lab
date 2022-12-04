class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    users = User.find(params[:id])
    render json: users, include: :items
    #using include item will call the .item method that is provided has_many and will serialize the item as a nested array of JSON data.
  end

  private

  def render_not_found_response
    render json: { error: "User  not found" }, status: :not_found
  end
end
