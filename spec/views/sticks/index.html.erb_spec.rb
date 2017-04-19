require 'rails_helper'

RSpec.describe "sticks/index", type: :view do
  before(:each) do
    assign(:sticks, [
      Stick.create!(
        :title => "Title",
        :color => "Color",
        :length => "9.99",
        :weight => "9.99",
        :price => "9.99"
      ),
      Stick.create!(
        :title => "Title",
        :color => "Color",
        :length => "9.99",
        :weight => "9.99",
        :price => "9.99"
      )
    ])
  end

  it "renders a list of sticks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
