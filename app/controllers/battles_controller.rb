class BattlesController < ApplicationController

  def index
  end

  def show
    @battle = Battle.find(params[:id])
    @chosen = Pokemon.find(@battle.chosen_pokemon)
    @foe = Pokemon.find(@battle.foe_pokemon)
    # HP that will be drained
    @chosen_hp ||= @chosen.hp
    @foe_hp ||= @foe.hp
  end

  def new
    @battle = Battle.new
    @pokemons = Pokemon.all
  end

  def create
    @battle = Battle.new(params[:battle])
    if @battle.save
      flash[:success] = "ENGAGE."
      redirect_to @battle
    else
      render 'new'
    end
  end

  def edit
    @choice = params[:commit]
    @turn = do_battle(@attack_choice)
    
  end

  def destroy
  end

end
