class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_error_record_not_found
    def show
        client = Client.find(params[:id])
        render json: client
    end

    private
    def render_error_record_not_found
        render json: { error: "Record not found" }, status: :not_found
    end
end
