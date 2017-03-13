class LandingsController < ApplicationController
  layout "landing"

  def index
    @fotd = Fotd.last
    @rand_record = Fact.find(@fotd.id)
    impressionist(@rand_record)
    return @rand_record
  end

  private

  def fact_params
    params.require(:fact).permit(:fact_string,:user_id, :displayed, :tag_list)
  end

end
