class BooksController < ApplicationController
before_filter :signed_in_user, only: [:edit, :update, :index,]
before_filter :admin_user, only: [:destroy, :update]
  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Book destroyed."
    redirect_to books_url
  end
end
