require 'rails_helper'

RSpec.describe "Fotds", type: :request do
  describe "GET /fotds" do
    it "works! (now write some real specs)" do
      get fotds_path
      expect(response).to have_http_status(200)
    end
  end
end
