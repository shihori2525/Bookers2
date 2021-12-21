class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])

  end

  def user_params_update
      params.require(:user).permit(:name, :email, :image, :introduction)
  end

end
