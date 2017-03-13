require 'rails_helper'

RSpec.describe "fotds/new", type: :view do
  before(:each) do
    assign(:fotd, Fotd.new(
      :fact_id => 1
    ))
  end

  it "renders new fotd form" do
    render

    assert_select "form[action=?][method=?]", fotds_path, "post" do

      assert_select "input#fotd_fact_id[name=?]", "fotd[fact_id]"
    end
  end
end
