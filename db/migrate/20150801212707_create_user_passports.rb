class CreateUserPassports < ActiveRecord::Migration
  def change
    create_table :user_passports do |t|
      t.integer  :user_id,						             null: false, default: 0
      t.timestamps null: false
    end
  end
end
