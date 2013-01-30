# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type1      :string(255)
#  type2      :string(255)
#  hp         :integer
#  attack     :integer
#  defense    :integer
#  spatk      :integer
#  spdef      :integer
#  speed      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Pokemon do

	before { @pokemon = Pokemon.new(name: "Pikachu", type1: "Electric", type2: "", 
									hp: 35, attack: 55, defense: 30, 
									spatk: 50, spdef: 40, speed: 90)}

	subject { @pokemon }

	it { should be_valid }

  	it { should respond_to(:name) }
  	it { should respond_to(:type1) }
  	it { should respond_to(:type2) }
  	it { should respond_to(:hp) }
  	it { should respond_to(:attack) }
  	it { should respond_to(:defense) }
  	it { should respond_to(:spatk) }
  	it { should respond_to(:spdef) }
  	it { should respond_to(:speed) }

  	describe "when name is not present" do
  		before { @pokemon.name = " " }
  		it { should_not be_valid }
  	end

  	describe "when pokemon already exists" do
  		before do
  			same_pokemon = @pokemon.dup
  			same_pokemon.save
  		end

  		it { should_not be_valid }
  	end
end
