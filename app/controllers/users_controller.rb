class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.name = params[:user][:name]
        @user.email = params[:user][:email]
        @user.password = params[:user][:password]
        @user.password_confirmation = params[:user][:password_confirmation]

        if @user.save
            redirect_to root_path, notice: "Welcome, #{@user.name}!"
        else
            flash.now[:alert] = "Something went wrong, try again?"
            render :new
        end
    end
end
