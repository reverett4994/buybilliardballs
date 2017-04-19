require 'rails_helper'

RSpec.describe "sticks/edit", type: :view do
  before(:each) do
    @stick = assign(:stick, Stick.create!(
      :title => "MyString",
      :color => "MyString",
      :length => "9.99",
      :weight => "9.99",
      :price => "9.99"
    ))
  end

  it "renders the edit stick form" do
    render

    assert_select "form[action=?][method=?]", stick_path(@stick), "post" do

      assert_select "input#stick_title[name=?]", "stick[title]"

      assert_select "input#stick_color[name=?]", "stick[color]"

      assert_select "input#stick_length[name=?]", "stick[length]"

      assert_select "input#stick_weight[name=?]", "stick[weight]"

      assert_select "input#stick_price[name=?]", "stick[price]"
    end
  end
end
