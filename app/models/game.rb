class Game < ActiveRecord::Base
  belongs_to  :teams
  has_many    :votes, :foreign_key => 'gameid'
end
