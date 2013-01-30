module PokemonsHelper

	# Returns the pokemon type(s) formatted appropriately. 
	def format_type(type1, type2)
		if type2.empty?
			type1.titleize
		else 
			"#{type1.titleize}/#{type2.titleize}"
		end
	end

end
