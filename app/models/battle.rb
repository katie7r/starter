# == Schema Information
#
# Table name: battles
#
#  id             :integer          not null, primary key
#  chosen_pokemon :string(255)
#  foe_pokemon    :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Battle < ActiveRecord::Base
  attr_accessible :chosen_pokemon, :foe_pokemon

  
end
