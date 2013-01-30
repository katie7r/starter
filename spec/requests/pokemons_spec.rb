require 'spec_helper'

describe "Pokemon pages" do

  subject { page }

  describe "Pokedex page" do
  	before { visit pokedex_path }

  	it { should have_selector('title', text: 'Pokedex') }
  end

  describe "Pokemon page" do
  	let(:pokemon) { FactoryGirl.create(:pokemon) }
  	before { visit pokemon_path(pokemon) }

  	it { should have_selector('title', text: pokemon.name) }
  	it { should have_selector('td', pokemon.hp) }
  	it { should have_selector('td', pokemon.attack) }
  	it { should have_selector('td', pokemon.defense) }
  	it { should have_selector('td', pokemon.spatk) }
  	it { should have_selector('td', pokemon.spdef) }
  	it { should have_selector('td', pokemon.speed) }
  	it { should have_content(pokemon.type1) }
  end

  describe "Capture page" do 
  	before { visit capture_path }

  	it { should have_selector('title', text: 'Capture') }
  end

end
