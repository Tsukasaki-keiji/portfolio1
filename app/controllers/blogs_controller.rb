class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new, :create, :show]
  def index
    @blogs = Blog.all
    @blog = Blog.new
    @genres = Genre.where(is_active: true)
    @genre = @genres.find_by(id: params[:search])
    unless @genre.nil?
      @blogs = @blogs.where(genre_id: @genre.id)
      @title = @genre.name
    else
      @blogs = @blogs.where(is_active: true)
      @title = "すべての投稿"
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
    if @blog.save
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
    @comments = @blog.comments
    @comment = current_user.comments.new
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: "You have updated user successfully."
    else
      render "edit"
    end  
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    if @blog.user_id == current_user.id
      @blog.destroy
      redirect_to blogs_path
    else
      redirect_to blogs_path
    end  
  end

private
  def blog_params
    params.require(:blog).permit(:title, :body, :genre, :image, :rate, :genre_id)
  end

end
