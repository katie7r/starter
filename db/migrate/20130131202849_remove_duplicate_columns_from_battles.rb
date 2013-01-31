class RemoveDuplicateColumnsFromBattles < ActiveRecord::Migration
  def up
  	remove_column :battles, :chosen
  	remove_column :battles, :foe
  end

  def down
  end
end
