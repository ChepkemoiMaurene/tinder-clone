class SessionsController < ApplicationController
    def login_admin
        @admin = Admin.find_by(username: params[:username])
        if @admin&.authenticate(params[:password])
            session[:admin_id] = @admin.id
        else
        render json: { error: "Invalid password or username" }, status: :unauthorized
        end
    end
    def logout_admin
        @admin =Admin.find_by(id:session[:admin_id])   
        @admin.destroy
        render json: {message: "admin successfully logged out"}
        end 
     end
     def login_user       
        @user = User.find_by(username: params[:username])
        if @user&.authenticate(params[:password])
            session[:user_id]=@user.id
            render json: @user
          else
            render json: { error: "Invalid password or username" }, status: :unauthorized
        end    
      end
      def logout_user
        @user=User.find_by(id:session[:user_id])
        @user.destroy
        render json: {message:"user successfully logged out"}
      end
  end