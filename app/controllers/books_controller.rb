class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
   if @book.save
   redirect_to 
   else
   @books=Book.all
   render :index
   end
  end

  def index
    @book = Book.all

  end


private

  def list_params
    params.require(:book).permit(:title, :body)
  end

end