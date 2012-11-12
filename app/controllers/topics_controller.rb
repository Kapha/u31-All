class TopicsController < ApplicationController
before_filter :signed_in_user, only: [:edit, :update, :index, :create]
before_filter :admin_user, only: [:destroy, :update, :new, :create]

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def index
    @topics = Topic.paginate(page: params[:page])
  end

  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      flash[:success] = "Thank you for adding a new topic to the site."
      redirect_to @topic
    else
      render 'new'
    end
  end

end
