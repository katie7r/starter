module ApplicationHelper

	def favicon(icon)
		icon = 'pokeball' if icon.empty?
		favicon = icon + '-icon.png'
	end	

end
