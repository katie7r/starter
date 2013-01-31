class PokemonsController < ApplicationController

	def index
		@pokemons = Pokemon.all
	end

	def show
		@pokemon = Pokemon.find(params[:id])
		@wins = Battle.find(:all, conditions: { winner: params[:id] }).count
		@losses = Battle.find(:all, conditions: { loser: params[:id] }).count
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
