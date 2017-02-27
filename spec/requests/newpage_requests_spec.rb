require 'rails_helper'

RSpec.describe "Newpage request", :type => :request do

  json_headers = {
      "ACCEPT" => "application/json",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/json" # This is what Rails 3 accepts
    }

  html_headers = {
      "ACCEPT" => "application/xhtml+xml",     # This is what Rails 4 accepts
      "HTTP_ACCEPT" => "application/xhtml+xml" # This is what Rails 3 accepts
    }

  it "gets a json response", :js => true do
    get "/newpage.json", {}, json_headers

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(response.status).to eq(200)
    expect(response.code.to_i).to eq(200)
    expect(response.body).not_to be_empty
    expect(response.body).to be_truthy
  end

  it "json response has correct arrays", :js => true do
    get "/newpage.json", {}, json_headers

    expect(JSON.parse(response.body)).to have_key('newpages')
    expect(JSON.parse(response.body)["newpages"][0]).to have_key('username')
    expect(JSON.parse(response.body)["newpages"][0]).to have_key('trust_level')
    expect(JSON.parse(response.body)["newpages"][0]).to include('username' => 'system', 'trust_level' => 4)
    expect(JSON.parse(response.body)["newpages"][1]).to include('username' => 'PaddingtonBrown', 'trust_level' => 7)
=begin
{\"newpages\":[{\"username\":\"system\",\"trust_level\":4},{\"username\":\"PaddingtonBrown\",\"trust_level\":7}]}
=end
  end

  it "json response does not have incorrect arrays", :js => true do
    get "/newpage.json", {}, json_headers

    expect(JSON.parse(response.body)).not_to have_key('nonnewpages')
    expect(JSON.parse(response.body)["newpages"][0]).not_to have_key('nonusername')
    expect(JSON.parse(response.body)["newpages"][0]).not_to have_key('nontrust_level')
    expect(JSON.parse(response.body)["newpages"][0]).not_to include('username' => 'nonsystem', 'trust_level' => 99999)
    expect(JSON.parse(response.body)["newpages"][1]).not_to include('username' => 'nonPaddingtonBrown', 'trust_level' => 99999)
  end

  it "gets an html response", :js => true do
    get "/newpage", {}, html_headers

    expect(response.content_type).to eq("application/xhtml+xml")
    expect(response).to be_success
    expect(response).not_to be_redirect
    expect(response.status).to eq(200)
    expect(response.code.to_i).to eq(200)
    expect(response.body).not_to be_empty
    expect(response.body).to be_truthy
  end

  it "html response has correct footer", :js => true do
    get "/newpage", {}, html_headers

    expect(response.body).to match(/Discourse Newpage Footer/)
  end

  it "html response does not have incorrect footer", :js => true do
    get "/newpage", {}, html_headers

    expect(response.body).not_to match(/Discourse NonNewpage Footer/)
  end

end
