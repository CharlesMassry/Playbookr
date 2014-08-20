class AddNotNullToMediaPlayId < ActiveRecord::Migration
  def change
    change_column_null :media, :play_id, null: false
  end
end
