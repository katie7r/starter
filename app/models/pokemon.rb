# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type1      :string(255)
#  type2      :string(255)
#  hp         :integer
#  attack     :integer
#  defense    :integer
#  spatk      :integer
#  spdef      :integer
#  speed      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pokemon < ActiveRecord::Base
  attr_accessible :name, :attack, :defense, :hp, :name, :spatk, :spdef, :speed, :type1, :type2

  before_save do |pokemon|
  	pokemon.name = name.downcase
  	pokemon.type1 = type1.downcase
  	pokemon.type2 = type2.downcase
  end

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :type1, presence: true
  validates :hp, presence: true
  validates :attack, presence: true
  validates :defense, presence: true
  validates :spatk, presence: true
  validates :spdef, presence: true
  validates :speed, presence: true
end
