class CreateBeerManufacturers < ActiveRecord::Migration
  def change
    create_table :beer_manufacturers do |t|
      t.string  :name,						             null: false, default: ""


      t.timestamps null: false
    end
  end
end
