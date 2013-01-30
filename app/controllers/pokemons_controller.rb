class PokemonsController < ApplicationController

	def index
		@pokemons = Pokemon.all
	end

	def show
		@pokemon = Pokemon.find(params[:id])
	end

	def new
		@pokemon = Pokemon.new
	end

	def create
		@pokemon = Pokemon.new(params[:pokemon])
		if @pokemon.save
			flash[:success] = "SUCCESS."
			redirect_to @pokemon
		else
			render 'new'
		end
	end

	def edit

	end

	def update

	end

	def destroy

	end

	
end
