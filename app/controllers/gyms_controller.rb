class GymsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_error_record_not_found
    def show
        gym = Gym.find(params[:id])
        render json: gym
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.destroy
            head :no_content
        else
            render json: { error: "Gym not found" }, status: :not_found
        end
    end

    private
    def render_error_record_not_found
        render json: { error: "Record not found" }, status: :not_found
    end
end
