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

require 'spec_helper'

describe Battle do
  pending "add some examples to (or delete) #{__FILE__}"
end
