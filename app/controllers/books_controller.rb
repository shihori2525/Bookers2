class BooksController < ApplicationController

  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
   @books = Book.all
   @user = current_user
  end


private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
      params.require(:user).permit(:name, :profile_image_id, :introduction)
  end

end