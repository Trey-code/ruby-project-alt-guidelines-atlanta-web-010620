class CreateBeerLists < ActiveRecord::Migration[5.2]
  def change
    create_table :beer_lists do |t|
      t.integer :user_id
      t.integer :beer_id
      t.integer :rating
    end
  end
end
