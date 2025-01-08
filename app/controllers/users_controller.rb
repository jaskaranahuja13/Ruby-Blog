class UsersController < ApplicationController
  def profile
    @user.update(views: @user.views + 1)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
