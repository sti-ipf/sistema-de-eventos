require "spec_helper"

describe DirectorsController do
  describe "routing" do

    it "routes to #index" do
      get("/directors").should route_to("directors#index")
    end

    it "routes to #new" do
      get("/directors/new").should route_to("directors#new")
    end

    it "routes to #show" do
      get("/directors/1").should route_to("directors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/directors/1/edit").should route_to("directors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/directors").should route_to("directors#create")
    end

    it "routes to #update" do
      put("/directors/1").should route_to("directors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/directors/1").should route_to("directors#destroy", :id => "1")
    end

  end
end
