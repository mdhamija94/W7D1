class UsersController < ApplicationController
  before_action :must_be_logged_out

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      login!(user)
      redirect_to cats_url
    else
      render json: user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:users).permit(:user_name, :password)
  end
end
