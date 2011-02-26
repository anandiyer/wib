class Team < ActiveRecord::Base
    has_many :games, :foreign_key => 'visitingteamid', :foreign_key => 'hometeamid'
end
