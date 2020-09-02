class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user, only: [:destroy]

  def create
    @bookComment = BookComment.new(book_comment_params)
    if @bookComment.save
      redirect_back fallback_location: book_path(@bookComment.book_id)
    else
      redirect_back fallback_location: book_path(@bookComment.book_id)
    end
  end

  def destroy
    @bookComment = BookComment.find(params[:id])
    @bookComment.destroy
    redirect_back fallback_location: book_path(@bookComment.book_id)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:user_id, :book_id, :comment)
  end

  def check_user
    bookComment = BookComment.find(params[:id])
    user = User.find(bookComment.user_id)
    redirect_to book_path unless user == current_user
  end
end
