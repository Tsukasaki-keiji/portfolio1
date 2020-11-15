class UsersController < ApplicationController
   before_action :authenticate_user!, except:[:top, :about]
  def index
    @users = User.all
    @blog = Blog.new
  end
  
  def show
    @user = User.find(params[:id])
    @blogs = Blog.all
    @blog = Blog.new
    @bookmark = Bookmark.where(user_id: current_user.id)
  end
  
  def edit
    @user = User.find(params[:id])
    @blogs = Blog.all
    if @user != User.find(current_user.id)
      redirect_to user_path(current_user)
    end  
  end 
  
  def top
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :email)
  end  
end
