class UsersController < ApplicationController
    def create
        user = User.find_by(name:login_params[:name])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            redirect_to '/'
        else
            render 'username and password not valid'
            redirect_to 'login'
        end
    end
    private
        def login_params
            params.reuire(:login).permit(:name, :password)
        end
end
