class UsersController < ApplicationController
  
    

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:notice] = "Welcome! You have signed up successfully."
    end

    if @user.authenticate(user_params)
      flash.now[:notice] = "Signed in successfully."
    end

  end

  def index
    @book = Book.new

    @user = User.find(current_user.id)
    @users = User.all
  end

  def edit
    user = User.find(params[:id])

    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])

    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def show
    @book = Book.new
    @books = Book.all
    @user = User.find(params[:id])
  end


  private

    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end

end

