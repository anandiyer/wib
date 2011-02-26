class CreateLeagueTypes < ActiveRecord::Migration
  def self.up
    create_table :league_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :league_types
  end
end
