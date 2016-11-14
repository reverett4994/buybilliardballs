require 'rails_helper'

RSpec.describe "balls/new", type: :view do
  before(:each) do
    assign(:ball, Ball.new())
  end

  it "renders new ball form" do
    render

    assert_select "form[action=?][method=?]", balls_path, "post" do
    end
  end
end
