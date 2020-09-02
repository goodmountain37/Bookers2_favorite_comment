class ChangePostsToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts, :book_comments
  end
end
