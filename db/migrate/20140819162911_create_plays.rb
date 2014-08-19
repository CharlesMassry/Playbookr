class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :name, null: false
      t.text :description
      t.belongs_to :team, index: true

      t.timestamps
    end
  end
end
