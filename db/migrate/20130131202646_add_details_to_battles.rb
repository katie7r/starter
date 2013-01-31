class AddDetailsToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :chosen, :integer
    add_column :battles, :foe, :integer
    add_column :battles, :chosen_hp, :integer
    add_column :battles, :foe_hp, :integer
    add_column :battles, :winner, :integer
  end
end
