class CreateCircles < ActiveRecord::Migration[7.2]
  def change
    create_table :circles do |t|
      t.string :name

      t.timestamps
    end
  end
end
