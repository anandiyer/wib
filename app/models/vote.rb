class Vote < ActiveRecord::Base
  belongs_to :game, :user
end
