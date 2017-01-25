module DiscourseNewpage
	class NewpagesController < ApplicationController

		def my_page
			render :json => { name: "succotash", description: "yellow and green" }
      rescue StandardError => e
        render_json_error e.message
#      render text: 'Just sayin'			# at newpage.json !?
#      render inline: "<%= 'hello , ' * 3 + 'again' %>"	# at newpage.json !?
		end

	end
end