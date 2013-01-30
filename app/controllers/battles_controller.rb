class BattlesController < ApplicationController

  def index
  end

  def show
    @battle = Battle.find(param[:id])
  end

  def new
    @battle = Battle.new
    @pokemons = Pokemon.all
  end

  def create
  end

  def edit
  end

  def destroy
  end

end
