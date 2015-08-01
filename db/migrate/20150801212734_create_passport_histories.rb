class CreatePassportHistories < ActiveRecord::Migration
  def change
    create_table :passport_histories do |t|
      t.integer  :passport_id,						             null: false, default: 0
      t.integer  :beer_id, 										 null: false, default: 0
      t.timestamps 												 null: false
    end
  end
end
