class UsersController < ApplicationController

    # before_action :logged_in_user, only: %i[index edit update destroy]
    before_action :correct_user, only: %i[edit destory]
    before_action :admin_user, only: :destroy
    
    def index
        
    end
    def create
        user = User.find_by(name:login_params[:name])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        else
            render 'username and password not valid'
            redirect_to '/login'
        end
    end
    private
        def login_params
            params.reuire(:login).permit(:name, :password)
        end
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user)
        end
        def admin_user
            redirect_to(root_url) unless current_user.admin?
        end
end
