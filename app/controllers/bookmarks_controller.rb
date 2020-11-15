class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  #def index
  #end
  
  def create
    @blog = Blog.find(params[:blog_id])
    bookmark = @blog.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end  
  end 
  
  def destroy
    @blog = Blog.find(params[:blog_id])
    bookmark = @blog.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end  
  end  
end
