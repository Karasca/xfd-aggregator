class AddAlbumRefToCrossfade < ActiveRecord::Migration[7.2]
  def change
    add_reference :crossfades, :album, null: false, foreign_key: true
  end
end
