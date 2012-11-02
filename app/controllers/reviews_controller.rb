class ReviewsController < ApplicationController
  before_filter :signed_in_user

  def create
    @review = Review.new(params[:review])
    @review.user_id = current_user
    if @review.save!
      flash[:success] = "Thank you for your opinion."
      redirect_to reviews_path
    else
      @feed_items = []
      render book_url
    end
  end

  def destroy
  end

  def index
    @reviews = Review.paginate(page: params[:page])
  end

  def show
    @review = Review.find(params[:id])
    @book = @review.book
    @author = @book.author
  end
end
