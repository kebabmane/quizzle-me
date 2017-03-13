class Admin::HomesController < ApplicationController
  before_action :authenticate_user!
  before_action :tag_cloud

  def index
  	@fact_count = Fact.count(:all)
  	@user_count = User.count(:all)
	  @tag_count = Tag.count(:all)
	  @imp_count = Fact.sum(:views)
	  @device_count = Device.count(:all)
  end

  def tag_cloud
    @tags = Fact.tag_counts_on(:tags)
  end

end
