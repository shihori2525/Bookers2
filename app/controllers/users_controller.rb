class UsersController < ApplicationController

  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def show
    @user = User.find(params[:id])

  end

private

  def user_params
      params.require(:user).permit(:name, :profile_image_id, :introduction)
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
