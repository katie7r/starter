module ApplicationHelper

	def favicon(icon)
		icon = 'pokeball' if icon.empty?
		favicon = icon + '-icon.png'
	end	

	def icon_path(image)
		icon = favicon(image)
		image_path(icon)
	end

end
