require "rails_helper"

RSpec.describe FotdsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fotds").to route_to("fotds#index")
    end

    it "routes to #new" do
      expect(:get => "/fotds/new").to route_to("fotds#new")
    end

    it "routes to #show" do
      expect(:get => "/fotds/1").to route_to("fotds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fotds/1/edit").to route_to("fotds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fotds").to route_to("fotds#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fotds/1").to route_to("fotds#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fotds/1").to route_to("fotds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fotds/1").to route_to("fotds#destroy", :id => "1")
    end

  end
end
