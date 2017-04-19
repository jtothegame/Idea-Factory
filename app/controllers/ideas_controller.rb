class IdeasController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :find_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.offset(1).limit(11).order('created_at DESC')
    @last_idea = Idea.last
  end

  def show
    @idea = Idea.find(params[:id])
    @review = Review.new
  end

  def new
    @idea = Idea.new
  end

  def edit
    redirect_to root_path, alert: 'Access Denied' unless can? :edit, @idea
  end

  def create
    idea_params = params.require(:idea).permit(:title, :body, :author)
    @idea = Idea.new(idea_params)
    @idea.user = current_user

    if @idea.save
      flash[:notice] = 'Idea created!'
      redirect_to root_path(@idea)
    else
      flash.now[:alert] = 'Please fix the errors'
      render :new
    end
  end

  def update
    @idea = Idea.find params[:id]
    idea_params = params.require(:idea).permit([:title, :body, :image, :id])

    if !(can? :edit, @idea)
      redirect_to root_path, alert: 'Access Denied'
    elsif @idea.update(idea_params)
      redirect_to idea_path(@idea), notice: 'Idea updated'
    else
      render :edit
    end
  end

  def destroy
    if (can? :destroy, @idea)
      @idea.destroy
      redirect_to root_path, notice: 'Idea Deleted'
    else
      redirect_to root_path, alert: 'Access Denied'
    end
  end

  private

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      idea_params = params.require(:idea).permit([:title, :body, :author, :likes, :id])
    end

    def find_idea
      @idea = Idea.find params[:id]
    end

end
