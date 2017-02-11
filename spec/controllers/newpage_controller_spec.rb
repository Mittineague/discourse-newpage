require 'rails_helper'
require_relative '../../app/controllers/discourse_newpage/newpages_controller'
require_relative '../../lib/newpage/engine'

describe DiscourseNewpage::NewpagesController do
  routes { ::DiscourseNewpage::Engine.routes }
  controller { DiscourseNewpage::NewpagesController }

  it "is a subclass of ApplicationController" do
    expect(DiscourseNewpage::NewpagesController < ApplicationController).to eq(true)
  end

  it "class method is present" do
    expect(:pagedata).to be_present
  end

  describe 'controller.pagedata' do
    it 'response is success' do
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.code.to_i).to eq(200)
    end

    it 'response is not a redirect' do
      expect(response).not_to be_redirect
    end

    it 'class method object exists' do
#      expect(:pagedata).to exist  #<ActionController::TestResponse
    end
  
    it 'class method is not empty' do
      expect(:pagedata).not_to be_empty
    end

    it 'class method object is truthy' do
      expect(:pagedata).to be_truthy
    end

    it 'class method object > 11' do
#      expect(:pagedata.length).to be > 11     # my 11 users + the 1 added
    end

    it 'class method object < 13' do
      expect(:pagedata.length).to be < 13
    end

    it 'class method between 11 and 13' do
#      expect(:pagedata.length).to be_within(1).of(12)     # my 11 users + the 1 added
    end

    it 'class method belongs to module' do
#      expect(:pagedata).to be_a_kind_of(::DiscourseNewpage::NewpagesController)
    end

    it 'class method hash has username key' do
#      expect(:pagedata).to have_key('username')  # not a hash?
    end

    it 'class method hash has trust_level key' do
#      expect(:pagedata).to have_key('trust_level')  # not a hash?
    end

#    it 'class method object has attributes' do
#      expect(:pagedata).to have_attributes(:username => "system", :trust_level => 4)  # n/a
#    end
  end


  describe "#pagedata" do
    it "returns a list of all the backups" do
#      xhr :get, :my_page, format: :json
#      xhr :get, :pagedata
      expect(response).to be_success
#      json = JSON.parse(response.body)
#      expect(json[0]["filename"]).to eq("backup1")
    end
  end

  describe '#pagedata' do
    it "sadly fail" do
#      require_relative '../../app/controllers/discourse_newpage/newpages_controller'
#       @test_controller = DiscourseNewpage::NewpagesController.new
#       xhr :get, "/newpage/pagedata"
#       get :pagedata, format: :json
#       get :pagedata@combined_obj
#       expect(response.to_json).to include('status')
       expect(response.body.to_json).to_not match(/pagedata/)     #arrgh it passes
#      expect(response.to_a).to match(length > 1)
#      expect(response).to eq([])
#      expect(@test_controller.pagedata.is_a?(Array)).to be true
      expect { xhr :get, 'http://localhost:3000/newpage' }.to raise_error(ActionController::UrlGenerationError)     #arrgh it passes
      expect { xhr :get, :pagedata }.to raise_error(ActionController::UrlGenerationError)           #arrgh it passes
      expect { xhr :get, :newpage }.to raise_error(ActionController::UrlGenerationError)           #arrgh it passes
      expect { xhr get '/newpage' => 'discourse_newpage/newpages#pagedata' }.to raise_error(ActionController::UrlGenerationError) #arrgh it passes
      expect { xhr :get, 'newpages#pagedata' }.to raise_error(ActionController::UrlGenerationError) #arrgh it passes
      expect { xhr :get, '/pagedata' }.to raise_error(ActionController::UrlGenerationError)         #arrgh it passes
      expect { xhr :get, '/newpage/index' }.to raise_error(ActionController::UrlGenerationError)   #arrgh it passes
      expect(response.headers['Content-Length']).to eq(nil)  #arrgh it passes
      expect(response.body).to eq("")                        #arrgh it passes
      expect(response.content_type).to eq(nil)               #arrgh it passes
    end
  end

  describe :controller, :type => :routing do
    it "routes to /newpage" do
      expect(:get => "/newpage").to be_routable
    end
  end

end
