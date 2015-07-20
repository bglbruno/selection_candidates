require "rails_helper"

RSpec.describe CandidatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/candidates").to route_to("candidates#index")
    end

    it "routes to #show" do
      expect(:get => "/candidates/1").to route_to("candidates#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/candidates").to route_to("candidates#create")
    end

  end
end
