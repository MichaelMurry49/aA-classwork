class UsersController < ApplicationController
  before_action :require_logout, only: [:new]

  def index 
    @users = User.all 
    render :index 
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params) 
    if @user.save 
      login(@user)
      redirect_to cats_url 
    else  
      render @user.errors.full_messages 
    end
  end

  private 
  def user_params 
    params.require(:user).permit(:user_name, :password)
  end

end
