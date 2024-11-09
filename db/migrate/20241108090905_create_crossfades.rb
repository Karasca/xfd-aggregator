class CreateCrossfades < ActiveRecord::Migration[7.2]
  def change
    create_table :crossfades do |t|
      t.string :link

      t.timestamps
    end
  end
end
