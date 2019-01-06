class SessionsController < ApplicationController
    def create
        user = User.find_by(name:login_params[:name])
        if user && user.authenticate(login_params[:password])
            session[:user_id] = user.id
            flash[:login_succes] = ['user actived']
            redirect_to '/'
        else
            flash[:login_errors] = ['invalid username and password']
            redirect_to '/login'
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to '/'
    end
    def logout; end
    
    private
        def login_params
            params.require(:login).permit(:name, :password)
        end
end
