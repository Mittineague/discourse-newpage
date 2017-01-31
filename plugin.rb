# name: discourse-newpage
# about: learning exercise
# version: 0.2
# authors: Mittineague
# url: https://github.com/Mittineague/discourse-newpage.git

enabled_site_setting :mitt_newpage_enabled

Discourse::Application.routes.append do
  get '/newpage' => 'discourse_newpage/newpages#my_page'
end

load File.expand_path('../lib/newpage/engine.rb', __FILE__)