module ApplicationHelper
	def get_css_path
		if @css_file.nil?
			@css_file = "/css/landing-page.css"
		else
			@css_file
		end
	end

	def set_css_path(file)
		@css_file = file
	end
end
