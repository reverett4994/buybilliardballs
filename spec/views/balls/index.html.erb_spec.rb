require 'rails_helper'

RSpec.describe "balls/index", type: :view do
  before(:each) do
    assign(:balls, [
      Ball.create!(),
      Ball.create!()
    ])
  end

  it "renders a list of balls" do
    render
  end
end
