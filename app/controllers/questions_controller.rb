class QuestionsController < ApplicationController

  before_filter :signed_in_user,
                only: [:edit, :update, :index, :destroy]
  before_filter :admin_user, only: :destroy

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id   
    if @question.save
      flash[:success] = "Thank you for adding a new question to the site. Check back to see when it is answered."
      redirect_to @question
    else
      render 'new'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question destroyed."
    redirect_to questions_url
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.paginate(page: params[:page])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def update
    @question = Question.find(params[:id]) 
    if @question.update_attributes(params[:author])
      flash[:success] = "Question updated"
      redirect_to @question
    else
      render 'edit'
    end
  end


  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
