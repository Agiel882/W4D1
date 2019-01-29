class UsersController < ApplicationController

  def index
    users = User.all
    render json: users
    # render plain: "I'm in the index action!"
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.update(params[:id], user_params)
    if user
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def destroy
    user = User.find(params[:id])

    if user.destroy
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end