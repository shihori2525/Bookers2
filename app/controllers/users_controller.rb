class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
     @user = User.find(params[:id])
  end



  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
    redirect_to user_path(@user.id),notice:'You have updated user successfully.'
    else
    render :edit
    end

  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
   @user = User.find(params[:id])
   redirect_to (user_path(current_user.id)) unless @user == current_user
  end

end
