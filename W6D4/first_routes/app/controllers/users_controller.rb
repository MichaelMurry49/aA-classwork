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
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        user = User.find_by(id: params[:id])
        
        render json: user
    end

    
    def update
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422 
        end
    end
    
    def destroy
        # note: we use find_by :username because we defined a custom route
        # check routes.rb to see the difference between user and artwork
        user = User.find_by(username: params[:username])
        user.destroy
        render json: user 
    end

    private

    def user_params
        params.require(:user).permit(:id, :username)
    end
end
