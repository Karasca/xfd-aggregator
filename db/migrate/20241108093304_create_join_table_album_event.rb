class CreateJoinTableAlbumEvent < ActiveRecord::Migration[7.2]
  def change
    create_join_table :albums, :events do |t|
      # t.index [:album_id, :event_id]
      # t.index [:event_id, :album_id]
    end
  end
end
