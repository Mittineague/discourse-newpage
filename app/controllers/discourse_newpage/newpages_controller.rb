module DiscourseNewpage
  class NewpagesController < ApplicationController

    def my_page
      user_obj = User.where("id >= ?", -1)
      test_obj = [{username: "PaddingtonBrown", trust_level: 7}]
      combined_obj = user_obj + test_obj
      render :json => combined_obj
#      render :json => [{name: "milk", description: "cold"}, {name: "bread", description: "toast"}, {name: "coffee", description: "hot"}]
    rescue StandardError => e
      render_json_error e.message
#      render text: 'Just sayin'			# at newpage.json !?
#      render inline: "<%= 'hello , ' * 3 + 'again' %>"	# at newpage.json !?
    end

  end
end