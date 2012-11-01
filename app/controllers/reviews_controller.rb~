class MicropostsController < ApplicationController
  before_filter :signed_in_user

  def create
    @review = current_user.review.build(params[:micropost])
    if @review.save
      flash[:success] = "Review submitted!"
      redirect_to book_url
    else
      @feed_items = []
      render book_url
    end
  end

  def destroy
  end
end
