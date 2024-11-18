class AddStarToAlbums < ActiveRecord::Migration[7.2]
  def change
    add_column :albums, :star, :boolean
  end
end
