require 'rails_helper'

RSpec.describe "fotds/index", type: :view do
  before(:each) do
    assign(:fotds, [
      Fotd.create!(
        :fact_id => 1
      ),
      Fotd.create!(
        :fact_id => 1
      )
    ])
  end

  it "renders a list of fotds" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
