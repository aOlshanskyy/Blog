class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index categories]
  before_action :set_post, only: %i[show edit destroy]
  def index
    @posts = Post.order('created_at DESC')
  end

  def new
  	@post = Post.new
  	@categories = Category.all
    if params[:category_id] && category = Category.find_by_id(params[:category_id])
      @post.category_id = category.id
    end
  end

  def create
  	@post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_back(fallback_location: root_path)
  end

  def categories
    @posts = Post.where(category_id: params[:id]).order('created_at DESC')
  end

  def authors
    @posts = Post.where(user_id: params[:id]).order('created_at DESC')
  end

  private

  def set_post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :user_id)
  end
end
