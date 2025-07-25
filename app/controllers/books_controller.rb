class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @user = current_user
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     @book.save
     redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
