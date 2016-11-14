require 'rails_helper'

RSpec.describe "balls/edit", type: :view do
  before(:each) do
    @ball = assign(:ball, Ball.create!())
  end

  it "renders the edit ball form" do
    render

    assert_select "form[action=?][method=?]", ball_path(@ball), "post" do
    end
  end
end
