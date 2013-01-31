module BattlesHelper

	def check_for_winner()
		(@foe_hp > 0 && @chosen_hp > 0) ? won = false : won = true
		won
	end

	def get_attack_stats(choice)
		if choice.include?('Attack')
	      stats[:attack] = @chosen.attack
	      stats[:defend] = @foe.defense
	    else 
	      stats[:attack] = @chosen.spatk
	      stats[:defend] = @foe.spdef
	    end
	    stats
	end

	def get_attack_type(choice)
	    if choice.include?('Normal')
	    	type = 'normal'
	    else 
	    	type = @chosen.type1
	    end
	end

	def get_stab_modifier(attack_type, attacker_type)
		attack_type == attacker_type ? stab = 1.5 : stab = 1
		stab
	end

	def get_effectiveness(attack_type, defense_type)
		if attack_type == 'water'
			effect =   2 if defense_type== 'fire'
			effect = 0.5 if defense_type == 'grass'
		elsif attack_type == 'fire'
			effect =   2 if defense_type == 'grass'
			effect = 0.5 if defense_type == 'water'
		elsif attack_type == 'grass'
			effect =   2 if defense_type == 'water'
			effect = 0.5 if defense_type == 'fire'
		end
		effect ||= 1
	end

	def get_critical_hit()
		random_critical = rand(1..1000)
		critical = 2 if random_critical < 62.5 # Default 6.25% crit
		critical ||= 1
	end

	def get_modifier()
		random_mod = rand(1..15)
		modifier = (100 - random_mod) / 100.0
	end

	def calculate_damage(level, stats, type, base, stab, 
						 effectiveness, critical, modifier)
		# Damage calculation pieces
		level_piece = (2 * level + 10) / 250.0
		stats_piece = (stats[:attack] + 0.0) / stats[:defend]
		adjustment_piece = stab * effectiveness * critical * modifier
		# Damage calculation whole
		damage = (level_piece * stats_piece * base + 2) * adjustment_piece

	end

	def calculate_damage_dealt(choice)
		# Get damage factors
		level = 1 # NEVER LEVEL UP
		stats = get_attack_stats(choice)
		type  = get_attack_type(choice)
		base  = 35 # BORING ATTACKS
		# Get damage modifiers
		stab = get_stab_modifier(type, @chosen.type1)
		effectiveness = get_effectiveness(type, @foe.type1)
		critical = get_critical_hit()
		modifier = get_modifier()
		# Get damage total
		damage = calculate_damage(level, stats, type, base, stab, 
						 		  effectiveness, critical, modifier)
		# Flash action
		attack = 'attack' if choice.include?('Attack')
		attack ||= 'special attack'
		flashing = "#{@chosen.name.titleize} used a #{type} #{attack}, dealing #{damage} damage."
		flash[:chosen_attack] = flashing
		# Return damage
		damage
	end

	def calculate_damage_taken()
		# Get attack type
		random_type = rand(1..2)
		random_type == 1 ? type = @foe.type1 : type = 'normal'
		# Get stats to use
		random_stats = rand(1..2)
		if random_stats == 2
			attack = 'attack'
			stats = { attack: @foe.attack, defend: @chosen.defense }
		else
			attack = 'special attack'
			stats = { attack: @foe.spatk, defend: @chosen.spdef }
		end
		# Get other factors
		level = 1
		base = 35
		# Get modifiers
		stab = get_stab_modifier(type, @foe.type1)
		effectiveness = get_effectiveness(type, @chosen.type1)
		critical = get_critical_hit()
		modifier = get_modifier()
		# Calculate damage
		damage = calculate_damage(level, stats, type, base, stab, 
						 		  effectiveness, critical, modifier)
		# Flash action
		flashing = "#{@foe.name.titleize} used a #{type} #{attack}, dealing #{damage} damage."
		flash[:foe_attack] = flashing
		# Return damage
		damage
	end

	def do_battle(choice)
		# Attack in turns
		if @chosen.speed > @foe.speed
			dealt = caluclate_damage_dealt(choice)
			@foe_hp -= dealt.round
			unless check_for_winner()
				taken = calculate_damage_taken()
				@chosen_hp -= taken.round
			end
		else 
			taken = calculate_damage_taken()
			@chosen_hp -= taken.round
			unless check_for_winner()
				dealt = caluclate_damage_dealt(choice)
				@foe_hp -= dealt.round
			end
		end
		# Make sure hp is not below 0
		@chosen_hp = 0 if @chosen_hp < 0
		@foe_hp = 0 if @foe_hp < 0
		# Flash results if won
		flash[:success] = "YOU WIN" if @foe_hp == 0
		flash[:error] = "YOU LOSE" if @chosen_hp == 0
	end

end
