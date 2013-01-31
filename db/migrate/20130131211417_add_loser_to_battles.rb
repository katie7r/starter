class AddLoserToBattles < ActiveRecord::Migration
  def change
    add_column :battles, :loser, :integer
  end
end
