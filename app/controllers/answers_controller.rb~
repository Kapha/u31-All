class AnswersController < ApplicationController

  before_filter :signed_in_user,
                only: [:edit, :update, :index, :destroy]
  before_filter :admin_user, only: :destroy

  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = current_user.id   
    if @answer.save
      flash[:success] = "Thank you for answering this question."
      redirect_to @answer
    else
      render 'new'
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    flash[:success] = "Answer destroyed."
    redirect_to questions_url
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def index
    @answers = Answer.paginate(page: params[:page])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
