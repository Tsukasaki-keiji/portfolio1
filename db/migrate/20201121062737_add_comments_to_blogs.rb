class AddCommentsToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :comments, :text
  end
end
