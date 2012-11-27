class QvotesController < ApplicationController

  before_filter :signed_in_user,
                only: [:edit, :destroy, :create]
  before_filter :admin_user, only: :destroy


  def create
    current_user.qvote!(@question)
    respond_to do |format|
      format.html { redirect_to @question }
      format.js
    end
  end

  def destroy
    current_user.unqvote!(@question)
    respond_to do |format|
      format.html { redirect_to @question }
      format.js
    end
  end

  def index
  end

end

