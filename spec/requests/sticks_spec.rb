require 'rails_helper'

RSpec.describe "Sticks", type: :request do
  describe "GET /sticks" do
    it "works! (now write some real specs)" do
      get sticks_path
      expect(response).to have_http_status(200)
    end
  end
end
