module Api
  class RacesController < ApplicationController
    before_action :set_race, only: [:show, :update, :destroy]
    rescue_from Mongoid::Errors::DocumentNotFound do |exception|
      @msg = "woops: cannot find race[#{params[:id]}]"
      if !request.accept || request.accept == "*/*"
        render plain: @msg , status: :not_found
      else
        respond_to do |format|
          format.json { render status: :not_found, :template => "api/error_msg.json" }
          format.xml { render status: :not_found, :template => "api/error_msg.xml" }
        end
      end
    end
    rescue_from ActionView::MissingTemplate do |exception|
      Rails.logger.debug exception
      @msg = "woops: we do not support that content-type[#{request.accept}]"
      render plain: @msg , status: :unsupported_media_type
    end
    
    protect_from_forgery with: :null_session
    
    def index
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races, offset=[#{params[:offset]}], limit=[#{params[:limit]}]"
      else
        ## TODO
      end
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races/#{params[:id]}"
      else
        render @race
      end
    end

    def results
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races/#{params[:race_id]}/results"
      else
        ## TODO
      end
    end

    def show_result
      if !request.accept || request.accept == "*/*"
        render plain: "/api/races/#{params[:race_id]}/results/#{params[:id]}"
      else
        ## TODO
      end
    end
    
    def create
      if !request.accept || request.accept == "*/*"
        render plain: params[:race][:name]
      else
        @race = Race.new(race_params)
        if @race.save
          render plain: params[:race][:name], status: :created
        else
          render plain: :nothing, status: :unprocessable_entity
        end
      end
    end
    
    def update
      if @race.update(race_params)
        render json: @race, status: :ok
      else
        render plain: :nothing, status: :unprocessable_entity
      end
    end
    
    def destroy
      @race.destroy
      render nothing: true, status: :no_content
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_race
        @race = Race.find(params[:id])
      end
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def race_params
        params.require(:race).permit(:name, :date)
      end
  end
end