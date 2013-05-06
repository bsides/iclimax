class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name
      t.string :realm
      t.string :battlegroup
      t.integer :level
      t.boolean :side
      t.integer :achievementPoints

      t.timestamps
    end
  end
end
