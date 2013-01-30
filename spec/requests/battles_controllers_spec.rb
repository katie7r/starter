require 'spec_helper'

describe "Battle pages" do

	subject { page }
  
	describe "Pokemon selection" do
		before { visit select_path }

	end

	describe "Pokemon battle" do
		before { visit battle_path }

	end

end
