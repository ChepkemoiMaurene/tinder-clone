class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :active_record_not_found
    
    def index
        users=User.all
        render json: users, status: :ok
    end
    def show
        user=User.find(params[:id])
        render json: user, status: :ok
    end
    def create
        @user=User.create(user_params)
        render json: @user, status: :created
    end
    def update
        user=User.find(params[:id])
        user.update(user_params)
        render json:user, status: :accepted
    end
    def destroy
        user=User.find(params[:id])
        user.destroy
    end

    private
    def user_params    
        params.permit(:username, :password, :password_confirmation)
    end
    def render_unprocessable_entity(invalid)
        render json: {error:invalid.record.errors }, status: :unprocessable_entity
    end
    def active_record_not_found  
        render json: {error:"user with this ID not found"}, status: :not_found

    end
    
end

end
