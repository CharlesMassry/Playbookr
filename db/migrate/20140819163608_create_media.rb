class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :caption
      t.belongs_to :play, index: true

      t.timestamps
    end
  end
end
