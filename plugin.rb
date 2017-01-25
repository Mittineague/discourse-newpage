# name: discourse-newpage
# about: learning exercise
# version: 0.1
# authors: Mittineague
# url: https://github.com/Mittineague/discourse-newpage.git

enabled_site_setting :mitt_newpage_enabled

after_initialize do

  module ::DiscourseNewpage
    class Engine < ::Rails::Engine
      engine_name 'discourse-newpage'
      isolate_namespace DiscourseNewpage
    end
  end

  ::DiscourseNewpage::Engine.routes.draw do
    get '/newpage' => 'newpages#index'
  end

  require_dependency 'application_controller'

  Discourse::Application.routes.append do
    mount ::DiscourseNewpage::Engine, at: "/"
  end

  module ::DiscourseNewpage
    class NewpagesController < ::ApplicationController

      def index
        render :json => { name: "succotash", description: "yellow and green" }
      rescue StandardError => e
        render_json_error e.message
#      render text: 'Just sayin'			# at newpage.json !?
#      render inline: "<%= 'hello , ' * 3 + 'again' %>"	# at newpage.json !?
      end

    end
  end

end
