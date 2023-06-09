class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    def logged_in_admin
        @current_admin=Admin.find_by(id:session[:admin_id])

    end
end
