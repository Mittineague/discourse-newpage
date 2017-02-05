# name: discourse-newpage
# about: learning exercise
# version: 0.3
# authors: Mittineague
# url: https://github.com/Mittineague/discourse-newpage.git

enabled_site_setting :mitt_newpage_enabled

Discourse::Application.routes.append do
  get '/newpage' => 'discourse_newpage/newpages#my_page'
end

load File.expand_path('../lib/newpage/engine.rb', __FILE__)

#register_custom_html footer: "<h3>Discourse Newpage Footer</h3>"

after_initialize do
  @custom_footer = <<-EOF.strip_heredoc.chomp
    <div class="mitt_div">
    <h3>Discourse Newpage Footer</h3>
    <p>
    <span>As much HTML as wanted can be put here.</span>
    <span>Link to <a href="https://meta.discourse.org">Discourse Meta Forum</a></span>
    </p>
    </div>
EOF

  register_custom_html footer: @custom_footer

#  register_custom_html extraNavItem: "<div class='mitt_newpage' style='display: inline-block'><a href='/newpage'>Newpage</a></div>"
end