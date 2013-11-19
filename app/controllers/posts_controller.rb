class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params["id"]

  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    new_post = Post.create(post_params)
    category = Category.find(params["category_id"])
    category.posts << new_post
    redirect_to (post_path new_post)
  end

  def update
    @updated_post = Post.find(params[:id])
    @updated_post.attributes = post_params
    @updated_post.save
    redirect_to (post_path)
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to action: 'index'
  end

  private

  def post_params
    params.require(:post).permit(:title, :location, :text)
  end

end