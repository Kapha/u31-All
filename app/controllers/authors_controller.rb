class AuthorsController < ApplicationController

  before_filter :signed_in_user,
                only: [:edit, :update, :index, :destroy]
  before_filter :admin_user, only: :destroy

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
    if @user.update_attributes(params[:user])
      flash[:success] = "Profilie updated"
    else
      render 'edit'
    end
  end
end
