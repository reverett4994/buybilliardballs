require "rails_helper"

RSpec.describe SticksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sticks").to route_to("sticks#index")
    end

    it "routes to #new" do
      expect(:get => "/sticks/new").to route_to("sticks#new")
    end

    it "routes to #show" do
      expect(:get => "/sticks/1").to route_to("sticks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sticks/1/edit").to route_to("sticks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sticks").to route_to("sticks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sticks/1").to route_to("sticks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sticks/1").to route_to("sticks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sticks/1").to route_to("sticks#destroy", :id => "1")
    end

  end
end
