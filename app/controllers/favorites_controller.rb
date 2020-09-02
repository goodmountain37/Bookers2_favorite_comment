class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.create(user_id: current_user.id, book_id: params[:book_id])
    redirect_back fallback_location: books_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
    @favorite.destroy
    redirect_back fallback_location: books_path
  end
end
