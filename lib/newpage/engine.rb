module DiscourseNewpage
  class Engine < ::Rails::Engine
    isolate_namespace DiscourseNewpage

    config.after_initialize do
      Discourse::Application.routes.append do
        mount ::DiscourseNewpage::Engine, at: "/"
      end
    end

  end
end