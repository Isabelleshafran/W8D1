class UsersController < ApplicationController

    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new()
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to subs_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.delete
        redirect_to posts_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    
end