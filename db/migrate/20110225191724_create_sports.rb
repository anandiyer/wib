class CreateSports < ActiveRecord::Migration
  def self.up
    create_table :sports do |t|
      t.string :name
      t.integer :type
      t.integer :league
      t.binary :icon

      t.timestamps
    end
  end

  def self.down
    drop_table :sports
  end
end
