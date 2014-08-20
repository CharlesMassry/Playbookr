class AddNotNullToMediaPlayId < ActiveRecord::Migration
  def change
    change_column_null :media, :play_id, false
  end
end
