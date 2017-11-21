class AddLikesCountToPhotoposts < ActiveRecord::Migration[5.1]
  def change
    add_column :photoposts, :likes_count, :integer
  end
end
