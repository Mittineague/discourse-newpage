```
/discourse-newpage  
  plugin.rb  
  (site_setting, routes.append my_page, load engine)  
  /app  
    /controllers  
      /discourse_newpage  
         newpages_controller.rb  
         (def my_page render json)  
  /assets  
    /javascripts  
      /discourse  
        discourse-newpage-route-map.js.es6  
        (nest newpage index /)  
        /routes  
          newpage-index.js.es6  
          (model() setupController())  
        /templates  
          /newpage  
            index.hbs  
  /config  
    settings.yml  
    /locales  
      server.en.yml  
  /docs  
    directory-contents.md  
    version-history.md  
  /lib  
    /newpage  
      engine.rb  
      (routes.append mount)  
  /tesr  
    /javascripts  
      /acceptance  
        discourse-newpage-test.js.es6  
```        