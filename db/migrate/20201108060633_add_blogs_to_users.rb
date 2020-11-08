class AddBlogsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blogs, :text
  end
end
