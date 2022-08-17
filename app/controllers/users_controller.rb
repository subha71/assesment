class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        unless user_params[:email].empty?
            if @user.save
                session[:user_id] = @user.id
                flash[:notice] = "User created successfully."
                redirect_to @user
            else
                flash[:alert] = "Email ID already Exists"
            redirect_to new_user_path
            end
        else
            flash[:alert] = "All the fields are mandatory"
            redirect_to new_user_path
        end
    end

    def show
        @current_user = User.find(session[:user_id])
    end

    


private
def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
end
end
