module Api
  class RacersController < ApplicationController
    def index
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers"
      else
        ## TODO
      end
    end

    def show
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers/#{params[:id]}"
      else
        ## TODO
      end
    end
    
    def entries
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers/#{params[:racer_id]}/entries"
      else
        ## TODO
      end
    end

    def show_entry
      if !request.accept || request.accept == "*/*"
        render plain: "/api/racers/#{params[:racer_id]}/entries/#{params[:id]}"
      else
        ## TODO
      end
    end
  end
end