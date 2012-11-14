class CommentsController < ApplicationController

  before_filter :signed_in_user,
                only: [:edit, :update, :index, :destroy]
  before_filter :admin_user, only: :destroy

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id   
    if @comment.save
      flash[:success] = "Thank you for commenting on this answer."
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    Coment.find(params[:id]).destroy
    flash[:success] = "Comment destroyed."
    redirect_to questions_url
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def index
    @comments = Comment.paginate(page: params[:page])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
