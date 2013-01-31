# == Schema Information
#
# Table name: battles
#
#  id             :integer          not null, primary key
#  chosen_pokemon :string(255)
#  foe_pokemon    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  chosen_hp      :integer
#  foe_hp         :integer
#  winner         :integer
#

class Battle < ActiveRecord::Base
  attr_accessible :chosen_pokemon, :foe_pokemon, :chosen_hp, :foe_hp, :winner

  
end
