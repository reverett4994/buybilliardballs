require 'rails_helper'

RSpec.describe "sticks/show", type: :view do
  before(:each) do
    @stick = assign(:stick, Stick.create!(
      :title => "Title",
      :color => "Color",
      :length => "9.99",
      :weight => "9.99",
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
