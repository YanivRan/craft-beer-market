class FixBeersIndex < ActiveRecord::Migration
  def change
  	remove_index :beers, [:name]
	remove_index :beers, [:category_id]

  	add_index :beers, [:manufacturer_id, :name],            unique: true
    add_index :beers,  :name,                                  unique: true
    add_index :beers, :category_id,		                      unique: false
  end
end
