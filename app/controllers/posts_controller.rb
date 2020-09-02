class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:destroy]

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_back fallback_location: book_path(@post.book_id)
    else
      redirect_back fallback_location: book_path(@post.book_id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_back fallback_location: book_path(@post.book_id)
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :book_id, :comment)
  end

  def check_user
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    redirect_to book_path unless user == current_user
  end
end
