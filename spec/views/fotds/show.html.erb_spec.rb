require 'rails_helper'

RSpec.describe "fotds/show", type: :view do
  before(:each) do
    @fotd = assign(:fotd, Fotd.create!(
      :fact_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
