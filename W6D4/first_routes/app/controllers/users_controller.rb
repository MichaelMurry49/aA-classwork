class UsersController < ApplicationController

    def index
        @users = User.all

        render :index 
    end

    def create
        user = User.new(user_params)
        if user.save 
            render json: user 
        else
            render json: user.erros.full_messages 
        end
    end

    def new
        @user = User.new 
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user 
            render :show
        else
            redirect_to all_users_url
        end
    end

    
    def update
        user = User.find_by(id: params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422 
        end
    end
    
    def destroy
        # note: we use find_by :username because we defined a custom route
        # check routes.rb to see the difference between user and artwork
        user = User.find(params[:id])
        user.destroy
        render json: user 
    end

    private
    def user_params
        params.require(:user).permit(:id, :username)
    end
end
