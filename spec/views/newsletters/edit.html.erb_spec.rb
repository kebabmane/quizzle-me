require 'rails_helper'

RSpec.describe "newsletters/edit", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :email => "MyString",
      :subscribed => 1
    ))
  end

  it "renders the edit newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do

      assert_select "input#newsletter_email[name=?]", "newsletter[email]"

      assert_select "input#newsletter_subscribed[name=?]", "newsletter[subscribed]"
    end
  end
end
