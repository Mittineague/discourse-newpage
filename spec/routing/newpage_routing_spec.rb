require 'rails_helper'

RSpec.describe DiscourseNewpage::NewpagesController, :type => :routing do

  it "root is routable" do
    expect(:get => "/").to be_routable
  end

  it "newpage url is routable" do
    expect(:get => "/newpage").to be_routable
  end

  it "newpage symbol is routable" do
    expect(get: :newpage).to be_routable
  end

  it "newpage routes to pagedata" do
    expect(:get => '/newpage').to route_to(:controller => "discourse_newpage/newpages", :action => "pagedata")
  end

  it "nonewpage url is not routable" do
    expect(:get => "/nonewpage").not_to be_routable
  end

  it "nonewpage symbol is not routable" do
    expect(get: :nonewpage).not_to be_routable
  end

end
