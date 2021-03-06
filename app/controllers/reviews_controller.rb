class ReviewsController < ApplicationController
  before_filter :signed_in_user

  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user.id
    if @review.save!
      flash[:success] = "Thank you for your opinion."
      redirect_to reviews_path
    else
      @feed_items = []
      render book_url
    end
  end

  def index
    @reviews = Review.paginate(page: params[:page])
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
    @author = @book.author
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review Deleted."
    redirect_to books_url
  end

  def update
    @review = Review.find(params[:id])    
    if @review.update_attributes(params[:review])
      flash[:success] = "Review updated"
      redirect_to @review
    else
      render 'edit'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

end
