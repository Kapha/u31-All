class AuthorsController < ApplicationController

  before_filter :signed_in_user,
                only: [:edit, :update, :index, :destroy]
  before_filter :admin_user, only: :destroy

  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:success] = "Thank you for adding a new Author to the site."
      redirect_to @author
    else
      render 'new'
    end
  end

  def destroy
    Author.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to authors_url
  end

  def show
    @author = Author.find(params[:id])
    @books = @author.books.paginate(page: params[:page])
  end

  def destroy
    Author.find(params[:id]).destroy
    flash[:success] = "Author destroyed."
    redirect_to authors_url
  end

  def edit
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def index
    @authors = Author.paginate(page: params[:page])
  end

  def update
    @author = Author.find(params[:id])    
    if @author.update_attributes(params[:author])
      flash[:success] = "Author updated"
      redirect_to @author
    else
      render 'edit'
    end
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
