class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :chosen_pokemon
      t.string :foe_pokemon

      t.timestamps
    end
  end
end
