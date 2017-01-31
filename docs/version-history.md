**version 0.2**  
`assets/javascripts/discourse/controllers/newpage-index.js.es6`  
and  
`assets/javascripts/discourse/initializers/discourse-newpage.js.es6`  
were basically empty shells with no code and not essential to the plugin, they were removed.     

`app/controllers/discourse_newpage/newpages_controller.rb`  
code changed from a hard-coded JSON object to use the Discourse User JSON, and a hard-coded JSON object.   

`assets/javascripts/discourse/templates/newpage/index.hbs`  
code changed to use "each"  

`test/javascripts/acceptance/discourse-newpage-test.js.es6`  
added qunit tests  
run at `http://localhost:3000/qunit?module=Acceptance%3A%20Discourse%20Newpage`  

**version 0.1**  

Plugin inspired by [Creating Routes in Discourse and Showing Data](https://meta.discourse.org/t/creating-routes-in-discourse-and-showing-data/48827?u=mittineague)  
Using other Discourse plugins as examples, the initial code worked for a ".json" request. Thus it appeared that the Ruby code was at least "OK".  
However, after countless failed attempts at getting the Ember code to work, joebuhlig submiitted a pull request that put what was needed in place.  
See [Trouble getting a top level page to Ember](https://meta.discourse.org/t/trouble-getting-a-top-level-page-to-ember/56007?u=mittineague)  
