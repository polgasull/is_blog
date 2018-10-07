class PostsController < ApplicationController
  before_action :find_post_id, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    @post.save ? (redirect_to @post) : (render "new")

  end

  def show
  end

  def update
    @post.update(post_params) ? (redirect_to @post) : (render "edit")
  end

  def edit
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post_id
    @post = Post.find(params[:id])
  end

end
