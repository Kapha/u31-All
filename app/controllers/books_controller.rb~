class BooksController < ApplicationController
before_filter :signed_in_user, only: [:edit, :update, :index, :create]
before_filter :admin_user, only: [:destroy, :update]
  def show
    @book = Book.find(params[:id])
    @author = @book.author_id
  end

  def update
    @book = Book.find(params[:id])    
    if @book.update_attributes(params[:book])
      flash[:success] = "Book updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def new
    @book = Book.new(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.paginate(page: params[:page])
  end

  def destroy
    Book.find(params[:id]).destroy
    flash[:success] = "Book destroyed."
    redirect_to books_url
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def create
    @book = Book.new(params[:book])
    if @book.save!
      flash[:success] = "Thank you for adding a new book to the site."
      redirect_to @book
    else
      render 'new'
    end
  end
end
