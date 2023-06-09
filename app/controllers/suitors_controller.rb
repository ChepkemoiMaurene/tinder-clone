class SuitorsController < ApplicationController
    def index
        suitors=Suitor.all
        render json:suitors, status: :ok
    end
    def show
        suitors=Suitor.find(params[:id])
        render json:suitors, status: :ok
    end
    def update
        suitors=Suitor.find(params[:id])
        suitors.update(suitors_params)
        render json:suitors, status: :ok
    end
    def destroy
        suitors=Suitor.find(params[:id])
        suitors.destroy
    end 
        def create
            if logged_in_admin
                @suitors = Suitor.create(suitors_params)
                render json: @suitors, status: :created
            else
                render json: {error: "Only admins can create a movie"}


            end
        end
        private
        def suitors_params
            params.permit(:username, :password, :password_confirmation, :image_url)

        end
        def render_unprocessable_entity(invalid)
            render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity

        end
        def active_record_not_found
            render json: {error:"suitor with this ID not found"},status: :not_found
            
        end
end
