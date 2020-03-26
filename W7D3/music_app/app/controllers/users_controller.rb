class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @users = User.all 
        render :index 
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user 
            render :show 
        else
            @user.errors_full_messages
        end
    end

    def new
        @user = User.new()
        render :new
    end

    def edit
        @user = User.find_by(id: params[:id]) 
        render :edit 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to users_url
        else
            render :new 
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user 
            @user.update(user_params)
            redirect_to users_url 
        else
            render :edit 
        end
    end

    def destroy
        @user = find_by(id: params[:id])
        @user.destroy
        redirect_to users_url 
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
