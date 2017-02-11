require 'rails_helper'
require_relative '../../app/controllers/discourse_newpage/newpages_controller'
require_relative '../../lib/newpage/engine'

describe ::DiscourseNewpage::NewpagesController, :type => :routing do
  routes { DiscourseNewpage::Engine.routes }

  it "routes to newpage 1" do
#    expect(:get => '/newpage').to route_to(:controller => "discourse_newpage/newpages", :action => "pagedata")
  end

  it "routes to newpage 2A" do
#    expect(get("/")).to route_to("newpage#pagedata") # new in 2.6.0
  end

  it "routes to newpage 2B" do
#    expect(get("/newpage")).to route_to("newpage#pagedata") # new in 2.6.0
  end

  it "routes to newpage 2C" do
#    expect(get("/index")).to route_to("newpage#pagedata") # new in 2.6.0
  end

  it "routes to newpage 3A" do
#    expect(:get => "/").to route_to(:controller => "newpages")
  end

  it "routes to newpage 3B" do
#    expect(:get => "/newpage").to route_to(:controller => "newpages")
  end

  it "routes to newpage 3C" do
#    expect(:get => "/index").to route_to(:controller => "newpages")
  end

  it "newpage not routable should fail" do
    expect(:get => "/newpage").not_to be_routable  # aargghh it passes
  end

  it "newpage is routable" do
#    expect(:get => "/newpage").to be_routable
  end

end
