require 'rails_helper'

RSpec.describe "newsletters/new", type: :view do
  before(:each) do
    assign(:newsletter, Newsletter.new(
      :email => "MyString",
      :subscribed => 1
    ))
  end

  it "renders new newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletters_path, "post" do

      assert_select "input#newsletter_email[name=?]", "newsletter[email]"

      assert_select "input#newsletter_subscribed[name=?]", "newsletter[subscribed]"
    end
  end
end
