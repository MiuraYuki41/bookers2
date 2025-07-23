class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def show
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
