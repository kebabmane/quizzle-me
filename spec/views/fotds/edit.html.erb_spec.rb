require 'rails_helper'

RSpec.describe "fotds/edit", type: :view do
  before(:each) do
    @fotd = assign(:fotd, Fotd.create!(
      :fact_id => 1
    ))
  end

  it "renders the edit fotd form" do
    render

    assert_select "form[action=?][method=?]", fotd_path(@fotd), "post" do

      assert_select "input#fotd_fact_id[name=?]", "fotd[fact_id]"
    end
  end
end
