```
/discourse-newpage  
  plugin.rb  
  (site_setting, routes.append my_page, load engine)  
  /app  
    /controllers  
      /discourse_newpage  
         newpages_controller.rb  
         (def pagedata render json)  
  /assets  
    /javascripts  
      /discourse  
        discourse-newpage-route-map.js.es6  
        (nest newpage index /)  
        /initializers  
          newpage.js.es6  
        /routes  
          newpage-index.js.es6  
          (model() setupController())  
        /templates  
          /newpage  
            index.hbs  
  /config  
    settings.yml  
    /locales  
      client.en.yml  
      server.en.yml  
  /docs  
    directory-contents.md  
    version-history.md  
  /lib  
    /newpage  
      engine.rb  
      (routes.append mount)  
  /spec
    /requests
      newpahe_requests_spec.rb
    /routing
      newpage_routing_spec.rb
  /test  
    /javascripts  
      /acceptance  
        discourse-newpage-test.js.es6  
```        