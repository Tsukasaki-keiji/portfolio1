class BlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @blogs = Blog.all
    @blog = Blog.new
    @genres = Genre.where(is_active: true)
    @genre = @genres.find_by(id: params[:search])
    unless @genre.nil?
      @blogs = Blog.where(genre_id: @genre.id)
      @title = @genre.name
    end  
  end
  
  def edit
    @blog = Blog.find(params[:id])
   if current_user.id != @blog.user_id
      redirect_to blogs_path
   end
  end  
  
  def new
    @blog = Blog.new
  end 
  
  def create
    @blog = Blog.new(blog_params)
    @genres = Genre.where(is_active: true)
    @blog.user_id = current_user.id
    if @blog.save!
      redirect_to blog_path(@blog), notice: "You have created book successfully."
    else
      @blogs = Blog.all
      render 'index'
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_new = Blog.new
    @genres = Genre.where(is_active: true)
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

private
  def blog_params
    params.require(:blog).permit(:title, :body, :genre, :image, :rate, :genre_id)
  end

end
