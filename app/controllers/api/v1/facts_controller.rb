module Api
 module V1
  class FactsController < Api::BaseController

    respond_to :json

    def index
      rand_id = Fact.offset(rand(Fact.where(:displayed => true).count)).first
      @rand_record = Fact.find(rand_id)
      @widget = Fact.find(rand_id)

      impressionist(@widget)
      return @rand_record
      format.json
    end


    def thumbs_up
        json_response = params[:fact_id]
        @fact = json_response
        @fact.increment(:thumbs_up, by=1)
    end


    def thumbs_down
      json_response = params[:fact_id]
      @fact = json_response
      @fact.increment(:thumbs_down, by=1)
    end


     private

      def facts_params
        params.require(:fact).permit(:facts_string)
      end

      def query_params
        # this assumes that an album belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:facts_string)
      end

  end
 end
end
