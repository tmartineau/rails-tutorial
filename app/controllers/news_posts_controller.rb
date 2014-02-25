class NewsPostsController < ApplicationController

  before_action :authorize_for_news_posts, except: [:index, :show]
  
  #=================================
  # GET
  #=================================
  def index
    # @news_posts = NewsPost.all
    @news_posts = NewsPost.find(:all, :order => "created_at DESC")
  end

  def show
    @news_post = NewsPost.find(params[:id])
  end

  def new
    redirect_to root_path if current_user.blank?
    @news_post = NewsPost.new
  end

  def edit 
    authorize_for_news_posts
    @news_post = NewsPost.find(params[:id])
  end

  #=================================
  # POST
  #=================================
  def create
    news_post = NewsPost.new(news_post_params)
    if news_post.save
      redirect_to news_post
    else
      # DO SOMETHING
    end
  end

  #=================================
  # PATCH
  #=================================
  def update
    news_post = NewsPost.find(params[:id])
    news_post.update(news_post_params)
    redirect_to news_post
  end

  #=================================
  # DELETE
  #=================================
  def destroy
    news_post = NewsPost.find(params[:id])
    redirect_to news_posts_path
  end

  private

    def authorize_for_news_posts
      redirect_to root_path if current_user.blank?
    end

    def news_post_params
      params.require(:news_post).permit(:title, :body)
    end

end
