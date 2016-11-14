require 'rails_helper'

RSpec.describe "balls/show", type: :view do
  before(:each) do
    @ball = assign(:ball, Ball.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
