class Beers < ActiveRecord::Migration
  def change
  	create_table(:beers) do |t|
  	 	t.integer :manufacturer_id,              null: false, default: 0
  	 	t.string  :name,						             null: false, default: ""
		  t.integer :category_id,					         null: false, default: 0
		  t.integer :country_id, 					         null: false, default: 0
		  t.decimal :price, 						           null: false, precision: 8, scale: 2
		  t.string  :description,					         null: false, default: ""
		  t.boolean :archived,					           null: false, default: false

		  t.timestamps null: false
  	end

  	 	add_index :beers, :name,              unique: true
    	add_index :beers, :category_id,		    unique: true
  end
end
