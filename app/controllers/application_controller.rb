class ApplicationController < ActionController::Base

    include SessionsHelper

    private
        def logged_in_user
            return if logged_in?

            store_location
            flash[:danger] = 'please login'
            redirect_to '/login'
        end

        def user_is_admin
            return if logged_in? && current_user.admin?

            flash[:info] = "don't have the previliges for this section"
            # redirect_back(fallback_location: 'root_url')
        end

end
