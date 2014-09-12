class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
      t.belongs_to :team, index: true
      t.json :stats

      t.timestamps
    end
  end
end
