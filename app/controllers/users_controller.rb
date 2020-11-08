class UsersController < ApplicationController
   before_action :authenticate_user!, except:[:top, :about]
  def index
    @users = User.all
    @blog = Blog.new
  end
  
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @blog = Blog.new
  end
  
  def edit
    @user = User.find(params[:id])
  end 
  
  def top
  end
  
  
  def update
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
