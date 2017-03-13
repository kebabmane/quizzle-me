require 'spec_helper'
require 'rails_helper'



describe "quizzle static content" do
  it " directs to the quizzle page" do
  	visit "/"
  	expect(page).to have_content("quizzle")
  end
end

