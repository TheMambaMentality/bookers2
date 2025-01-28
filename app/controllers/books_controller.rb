class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books= Book.all
    if @book.save
     flash[:notice] = "You have created book successfully."
     redirect_to book_path(@book.id)
    else 
    @books = Book.includes(:user).all
    @user = User.find(current_user.id)
     render :index
   end
  end
  
  def edit
    @book = Book.find(params[:id])
    unless current_user.id == @book.user_id
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id) 
    else
    render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    @books = Book.includes(:user).all
    @user = User.find(current_user.id)
    redirect_to books_path
  end
  
  def index
    @books = Book.includes(:user).page(params[:page])
    @user = User.find(current_user.id)
  end
  
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
