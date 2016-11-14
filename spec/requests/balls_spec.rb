require 'rails_helper'

RSpec.describe "Balls", type: :request do
  describe "GET /balls" do
    it "works! (now write some real specs)" do
      get balls_path
      expect(response).to have_http_status(200)
    end
  end
end
