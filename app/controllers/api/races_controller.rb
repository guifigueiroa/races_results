module Api
  class RacesController < ApplicationController
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
        ## TODO
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
        ## TODO
      end
    end
  end
end