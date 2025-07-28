class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new #情報を入れるためのもの(エラー文)
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      @user = current_user
      render :index
     end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @user = current_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      render :edit  #エラー分の時はrender
    end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy 
      redirect_to books_path
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user_id == current_user.id
      redirect_to books_path
    end
  end
end
