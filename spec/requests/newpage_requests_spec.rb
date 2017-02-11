require 'rails_helper'
require_relative '../../app/controllers/discourse_newpage/newpages_controller'
require_relative '../../lib/newpage/engine'

describe "Newpage request", :type => :request do

  it "gets a json response" do
    headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }
    get "http://localhost:3000/newoage", {}, headers

    expect(response.content_type).to eq("application/json")
#    expect(response).to have_http_status(:created)
  end

end
