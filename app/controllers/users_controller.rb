class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @user=current_user
      @books=Book.all
      render :index
    end
  end

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def new
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully created."
      redirect_to user_path(current_user.id)
    else
      @user = User.find(params[:id])
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
