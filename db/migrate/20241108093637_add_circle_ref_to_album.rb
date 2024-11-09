class AddCircleRefToAlbum < ActiveRecord::Migration[7.2]
  def change
    add_reference :albums, :circle, null: false, foreign_key: true
  end
end
