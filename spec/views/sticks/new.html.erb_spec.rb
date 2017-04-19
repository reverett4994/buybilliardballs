require 'rails_helper'

RSpec.describe "sticks/new", type: :view do
  before(:each) do
    assign(:stick, Stick.new(
      :title => "MyString",
      :color => "MyString",
      :length => "9.99",
      :weight => "9.99",
      :price => "9.99"
    ))
  end

  it "renders new stick form" do
    render

    assert_select "form[action=?][method=?]", sticks_path, "post" do

      assert_select "input#stick_title[name=?]", "stick[title]"

      assert_select "input#stick_color[name=?]", "stick[color]"

      assert_select "input#stick_length[name=?]", "stick[length]"

      assert_select "input#stick_weight[name=?]", "stick[weight]"

      assert_select "input#stick_price[name=?]", "stick[price]"
    end
  end
end
