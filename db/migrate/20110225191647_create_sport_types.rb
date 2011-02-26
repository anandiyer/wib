class CreateSportTypes < ActiveRecord::Migration
  def self.up
    create_table :sport_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :sport_types
  end
end
