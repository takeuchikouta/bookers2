class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user=current_user
      @books=Book.all
      render :index
      # @books=Book.all
      # # flash.now[:notice] = "Book was error create."
      # render :index
    end
  end

  def show
    @user=current_user
    @book = Book.find(params[:id])
  end

  def index
    @user=current_user
    @book=Book.new
    @books=Book.all
  end

  def edit
     @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])  # データ（レコード）を1件取得
    @book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

   private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end