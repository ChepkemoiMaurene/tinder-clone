class AdminsController < ApplicationController
    def index
        admins= Admin.all
        render json:admins, status: :ok
    end
    def show
        admin= Admin.find(params[:id])
        if @admin.save
            render json:admin, status: :ok
        end

    def create
        @admin = Admin.create!(admin_params)
        if @admin.save
            render json:admin, status: :ok
        end
    def update
        admin= Admin.find(params[:id])
        admin.update(admin_params)
        render json:admin, status: :ok     
    end
    def destroy
        admin= Admin.find(params[:id])
        admin.destroy
    end
    private
    def admin_params
        params.permit(:username, :password,:password_confirmation)
    
    end
    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}status: :render_unprocessable_entity
    end
    def active_record_not_found
        render json:{error: "admin with this ID not found"}

    end
end

