class MembershipsController < ApplicationController

    def create
        membership = Membership.create!(member_params)
        render json: membership.gym,status: :created
    end

    def destroy
        membership = Membership.find_by(id: params[:id])
        if membership
            membership.destroy
            head :no_content
        else
            render json: {error: "Membership not found"} ,status: :not_found
        end
    end

    private

    def member_params
        params.permit(:gym_id,:charge,:client_id)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end
end
