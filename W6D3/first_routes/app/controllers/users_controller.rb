class UsersController < ApplicationController

    def index
        users = User.all

        render json: users
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
        render json: params
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end

    def update
        # debugger
        user = User.find(params[:id])
        if user.update(user_params)
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: 422 
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user 
    end
end
