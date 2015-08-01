class CreateBeerCategories < ActiveRecord::Migration
  def change
    create_table :beer_categories do |t|
      t.string :name,					null: false, default: ""
	  t.string :description, 			null: true

      t.timestamps null: false
    end

    add_index :beer_categories, :name,              unique: true
  end
end
