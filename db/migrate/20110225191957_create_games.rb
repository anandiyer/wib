class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :visitingteamid
      t.integer :hometeamid
      t.datetime :time
      t.string :location
      t.integer :winnerid
      t.integer :visitingteamscore
      t.integer :hometeamscore
      t.datetime :createdat
      t.datetime :updatedat

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
