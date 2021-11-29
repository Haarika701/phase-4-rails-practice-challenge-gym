class ClientsController < ApplicationController
    def show
        client = Client.find(:id params[:id])
        if client
            render json:client
        else
          render json: { error: "Client not found" }, status: :not_found
        end
    
    end
end
