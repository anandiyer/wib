class Game < ActiveRecord::Base
  has_many :votes, :foreign_key => 'gameid'
end
