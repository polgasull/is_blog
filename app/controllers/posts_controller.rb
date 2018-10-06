class PostsController < ApplicationController

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
    find_post_id
  end

  def update
    find_post_id

    @post.update(post_params) ? (redirect_to @post) : (render "edit")
  end

  def edit
    find_post_id
  end

  def destroy
    find_post_id
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
