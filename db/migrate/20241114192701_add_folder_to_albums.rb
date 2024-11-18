class AddFolderToAlbums < ActiveRecord::Migration[7.2]
  def change
    add_column :albums, :folder, :string
  end
end
